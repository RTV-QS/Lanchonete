# Verificação de backend — cadastro e login do cliente

**Responsável:** Leonardo Vaz
**Data:** 11/10/2026
**Sistema:** Lanchonete Online, fork `RTV-QS/Lanchonete`, branch `trabalho-qs`
**Ambiente:** Docker 27.5.1 e Compose v2.26.1 no WSL2 (Windows 11), aplicação em
Tomcat 8.5 / JRE 8 e PostgreSQL 13, subidos com `docker-compose.windows.yml`

---

## O que este documento é, e o que não é

Este **não** é o registro de execução dos casos de teste manuais. Os casos CT-AL
são projetados para execução pela interface, e a execução de registro é feita no
TestLink, no projeto "Lanchonete Online" — ver a planilha
`casos-teste-CT-AL.csv` e os relatórios do TestLink nesta mesma pasta.

Este documento registra uma atividade anterior e distinta: a **verificação dos
defeitos suspeitos diretamente contra os endpoints**, com requisições HTTP aos
servlets `/cadastro`, `/login`, `/logout` e `/validarToken`, e conferência do
estado resultante no banco com SQL.

A motivação é a regra de triagem do Plano de Teste, seção 2.3: só vira issue o
defeito confirmado. Levantar suspeitas lendo o código é barato e impreciso — na
suíte unitária de `AuthenticationResource` (Adopet), duas hipóteses levantadas por
leitura foram refutadas pela execução. Verificar contra o sistema rodando, antes de
reportar, evita issue infundada e permite escrever na issue a evidência concreta:
o código HTTP, o corpo da resposta e o resultado da consulta ao banco.

Em termos de técnica, é teste de caixa-preta na camada de serviço, conduzido
manualmente, requisição por requisição. Não é teste automatizado: não há suíte,
não há asserções versionadas e nada disso roda em CI. É investigação.

---

## Resumo

| Suspeita | Resultado da verificação | Issue |
| --- | --- | --- |
| Nome de usuário duplicado é aceito | **Confirmada**, e com consequência pior que a prevista | #8 |
| Login do usuário original para de funcionar após a duplicação | **Confirmada** | #8 |
| Apóstrofo no usuário quebra o login por SQL concatenado | **Confirmada** | #9 |
| Número de endereço inválido resulta em 500 | **Confirmada** | #10 |
| Logout não invalida as outras sessões; tokens não expiram | **Confirmada** | #11 |
| Senha só de espaços é aceita | **Confirmada**, com severidade menor que a prevista | #12 |
| Senha de espaços cria conta inacessível pela tela | **Refutada** | — |
| Senha do cliente é gravada sem hash | **Refutada**: a Lanchonete aplica MD5 | — |
| Conexões com o banco nunca são fechadas, até esgotar o limite | **Confirmada** (achado durante a execução, ver adendo) | #14 |
| Carrinho abre sem sessão quando a validação de sessão falha | **Confirmada** (achado durante a execução, ver adendo) | #15 |

---

## 1. Cadastro e login no caminho feliz

```
POST /cadastro   {usuario: ct01, senha: Senha123, ...}   ->  HTTP 200
corpo: Usuário Cadastrado!

SELECT id_cliente, usuario, nome, senha, fg_ativo FROM tb_clientes;
 1 | ct01 | Leonardo | 10a9c136d796bab18d3e144092a4f20a | 1

SELECT senha = MD5('Senha123') FROM tb_clientes WHERE usuario='ct01';
 t

POST /login      {usuario: ct01, senha: Senha123}        ->  HTTP 200
corpo: ../carrinho/carrinho.html

SELECT COUNT(*) FROM tb_tokens;   ->  1
formato do token: 6-2026-10-11T21:22:04.792Z
```

Funciona como esperado. Vale registrar que a senha **é** gravada com hash (MD5),
o que refuta a suspeita inicial de armazenamento em texto puro. MD5 sem sal não é
adequado para senha, mas é um cuidado presente — e o contraste é relevante para o
nosso trabalho, porque a classe `AuthenticationResource` do Adopet, testada por
mim na suíte unitária, grava a senha **sem nenhum hash** (issue `Adopet#15`).

---

## 2. Usuário duplicado e perda de acesso à conta — issue #8

A coluna `usuario` não tem restrição de unicidade. Confirmado no catálogo do
PostgreSQL, não apenas no DDL:

```sql
SELECT i.relname AS indice, a.attname AS coluna, ix.indisunique AS e_unique
  FROM pg_index ix
  JOIN pg_class i ON i.oid = ix.indexrelid
  JOIN pg_class t ON t.oid = ix.indrelid
  JOIN pg_attribute a ON a.attrelid = t.oid AND a.attnum = ANY(ix.indkey)
 WHERE t.relname = 'tb_clientes';

         indice            |   coluna   | e_unique
---------------------------+------------+----------
 pk_tb_clientes_id_cliente | id_cliente | t
(1 row)
```

O único índice da tabela é a chave primária. E `Controllers/cadastro.java` chama
`clienteDAO.salvar(cliente)` sem consultar existência.

```
POST /cadastro   {usuario: ct01, senha: OutraSenha456, nome: Impostor}  ->  HTTP 200
corpo: Usuário Cadastrado!

SELECT usuario, COUNT(*) FROM tb_clientes GROUP BY usuario;
 ct01 | 2

SELECT id_cliente, usuario, nome FROM tb_clientes WHERE usuario='ct01';
 1 | ct01 | Leonardo
 2 | ct01 | Impostor
```

A consequência é mais grave do que a duplicação em si. `DaoCliente.login` percorre
todo o `ResultSet` em um `while` e mantém apenas a **última** linha lida:

```java
while (rs.next()){
    validCliente.setUsuario(rs.getString("usuario"));
    validCliente.setSenha(rs.getString("senha"));
    validCliente.setFg_ativo(rs.getInt("fg_ativo"));
}
```

Com dois registros, só o mais recente autentica:

```
POST /login  {ct01, Senha123}        ->  corpo: erro                      (primeiro cadastro)
POST /login  {ct01, OutraSenha456}   ->  corpo: ../carrinho/carrinho.html  (segundo cadastro)
```

Ou seja: quem se cadastrar com um nome de usuário já existente passa a ser quem
entra, e o dono original é bloqueado da própria conta, sem aviso nenhum.

---

## 3. Apóstrofo no nome de usuário — issue #9

```
POST /cadastro   {usuario: o'brien, senha: Senha123}  ->  HTTP 200
SELECT id_cliente, usuario FROM tb_clientes;   ->   4 | o'brien

POST /login      {usuario: o'brien, senha: Senha123}  ->  HTTP 500
corpo: <!doctype html><html lang="en"><head><title>HTTP Status 500 – Internal Server Error</title>...
```

O cadastro funciona porque `DaoCliente.salvar` usa `PreparedStatement`. A
autenticação também passa, porque `DaoCliente.login` é parametrizado. A falha está
no passo seguinte: `login.java`, depois de validar as credenciais, chama
`DaoCliente.pesquisaPorUsuario` para obter o id e montar o token, e esse método
concatena:

```java
String sql = "SELECT * FROM tb_clientes WHERE usuario='"+cliente.getUsuario()+"'";
```

O apóstrofo quebra a sintaxe, a `SQLException` é reembalada em `RuntimeException` e
sobe até o container. O mesmo padrão aparece em `pesquisaPorID`. É a demonstração
de que a consulta é injetável, obtida sem explorar nada.

---

## 4. Cadastro sem validação — issue #10

```
POST /cadastro   {... numero: "abc" ...}   ->  HTTP 500
corpo: <!doctype html>...HTTP Status 500 – Internal Server Error...
SELECT COUNT(*) FROM tb_clientes WHERE usuario='ct05';   ->  0

POST /cadastro   {todos os campos vazios}  ->  HTTP 500
SELECT COUNT(*) FROM tb_clientes WHERE usuario='';       ->  0
```

`cadastro.java` lê `dados.getJSONObject("endereco").getInt("numero")` sem validar.
Qualquer valor não inteiro — incluindo string vazia — lança `JSONException`, que
não é tratada. Nenhum cliente é criado, o que é correto, mas o usuário recebe uma
página de erro em HTML em vez de saber qual campo corrigir.

---

## 5. Sessões e tokens — issue #11

```
login #1  ->  token A = 6-2026-10-11T21:22:04.792Z
login #2  ->  token B
SELECT COUNT(*) FROM tb_tokens;                      ->  2

POST /validarToken  (cookie do token A)   ->  corpo: valido
POST /logout        (cookie do token A)
SELECT COUNT(*) FROM tb_tokens;                      ->  1   (esperado: 0)
```

Os dois tokens valem ao mesmo tempo, e o logout remove apenas o token enviado no
cookie. Agravante: o prazo de 30 minutos existe só no cookie
(`cookie.setMaxAge(30*60)`), e `tb_tokens` não guarda data de emissão —
`DaoToken.validar` apenas confere se a string existe. Um token capturado vale
indefinidamente.

Em contrapartida, a validação rejeita token inexistente corretamente:

```
POST /validarToken  (cookie token=1-2026-10-11T12:00:00Z)  ->  corpo: erro
```

---

## 6. Senha só de espaços — issue #12, e uma hipótese refutada

```
POST /cadastro   {usuario: ct08, senha: "   "}   ->  HTTP 200
SELECT COUNT(*) FROM tb_clientes WHERE usuario='ct08';   ->  1
POST /login      {usuario: ct08, senha: "   "}   ->  corpo: ../carrinho/carrinho.html
```

A suspeita inicial era mais grave: que o sistema criaria uma conta à qual o próprio
usuário nunca conseguiria acessar pela tela, porque `login.js` tem
`if(usuario && senha)`. **A verificação refutou.** A string `"   "` é *truthy* em
JavaScript, então passa pela checagem e o login funciona.

O defeito confirmado é apenas a ausência de validação de senha, e a severidade foi
classificada como baixa por causa disso — não média, como estava previsto.

---

## 7. Casos que se comportaram corretamente

```
POST /login  {ct01, SenhaErrada}   ->  corpo: erro;  SELECT COUNT(*) FROM tb_tokens -> 0
POST /login  {naoexiste, ...}      ->  corpo: erro
POST /login  {CT01, Senha123}      ->  corpo: erro   (usuário é sensível à caixa)
POST /login  {ct01, senha123}      ->  corpo: erro   (senha é sensível à caixa)
```

Uma observação de projeto, que não classifiquei como defeito: todas as respostas
dos servlets voltam com **HTTP 200**, mesmo nas falhas lógicas — a distinção fica
só no corpo (`erro` contra a URL de destino). É coerente com o estilo do resto do
sistema e o front-end lê o corpo, então não há falha observável pelo usuário; mas
é um ponto a levantar na inspeção de código da Entrega 2.

---

## Reprodução

O roteiro de requisições e consultas usado nesta verificação está em
`.scratch/verificar-cadastro-login.sh`, fora do repositório por ser ferramenta de
investigação e não artefato de teste. As consultas SQL de verificação estão
documentadas no roteiro de execução dos casos CT-AL.

---

## Adendo — 11/10/2026, durante a execução do CT-AL-17

Dois defeitos apareceram enquanto os casos manuais eram executados pela
interface, fora do roteiro previsto. Ambos foram verificados aqui de forma
controlada, e cobertos pelos casos novos CT-AL-20 e CT-AL-21.

### 8. Conexões com o banco nunca são fechadas — issue #14

`DaoUtil.conecta()` devolve uma conexão nova a cada chamada, e nenhuma classe DAO
a fecha:

```java
public Connection conecta(){
    Class.forName("org.postgresql.Driver");
    return DriverManager.getConnection(url, usuario, senha);
}
```

Cada DAO instanciado abre uma conexão que fica aberta para sempre. O login é o
caminho mais caro, porque instancia dois DAOs (`DaoCliente` e `DaoToken`).

Medição, com o banco recém-reiniciado:

```
conexões no início                       0
após 10 requisições a /validarToken     10     (1 por requisição)
após mais 10 requisições a /login       30     (2 por requisição)

SELECT state, COUNT(*) FROM pg_stat_activity WHERE datname='lanchonete' GROUP BY state;
 state | count
-------+-------
 idle  |    30
```

Todas em `idle`: abertas, sem uso e sem liberação. Com `max_connections = 100`,
cerca de 50 logins esgotam o banco.

Foi o que aconteceu de fato durante a execução dos casos manuais. A partir de
certo ponto, qualquer requisição passou a responder:

```
org.postgresql.util.PSQLException: FATAL: sorry, too many clients already
    DAO.DaoUtil.conecta(DaoUtil.java:21)
    DAO.DaoToken.<init>(DaoToken.java:25)
    Helpers.ValidadorCookie.validar(ValidadorCookie.java:22)
    Controllers.validarToken.processRequest(validarToken.java:48)
```

Agravante: a aplicação se conecta como `postgres`, que é superusuário. As
conexões vazadas ocupam também as vagas que o PostgreSQL reserva para
administração (`superuser_reserved_connections`), de modo que nem o `psql`
consegue mais entrar para diagnosticar. A recuperação exigiu reiniciar o
container do banco.

### 9. A validação de sessão falha aberta — issue #15

Com o banco indisponível, `/validarToken` responde 500 com a página de erro
padrão do Tomcat. E o guard do carrinho é este:

```javascript
// carrinho.js
function check(resposta){
    if(resposta.srcElement.responseText.includes("erro")){
        window.location.replace("../login/login.html?Action=TokenError");
    }
}
```

A decisão de barrar o acesso depende de a resposta conter a string `"erro"`, em
minúsculas. A página de erro do Tomcat está em inglês:

```
parando o container do banco
POST /validarToken sem cookie  ->  HTTP 500
ocorrências de "erro" na resposta:  0
ocorrências de "Error" na resposta: 2
```

Zero ocorrências de `"erro"`, então o `if` é falso, não há redirecionamento e **o
carrinho é exibido a um visitante sem nenhuma sessão**. Reproduzido em janela
anônima, sem cookie algum.

É o padrão oposto ao desejável em controle de acesso: diante de falha no
mecanismo de autenticação, o sistema concede em vez de negar. E é o mesmo vício
de estilo já observado no `login.js`, que decide sucesso com
`responseText.localeCompare("erro") == -1` — as duas telas tomam decisão de
segurança comparando texto do corpo da resposta, em vez de olhar o código HTTP.

Os dois defeitos se combinam: o vazamento de conexões derruba o banco, e a queda
do banco abre o carrinho para qualquer um.
