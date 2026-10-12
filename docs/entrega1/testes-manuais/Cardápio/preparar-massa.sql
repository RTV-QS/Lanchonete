-- Execute uma vez, somente no banco local exclusivo para os testes de Thiago.
-- Não usar no ambiente compartilhado: altera o status de funcionamento da loja.
BEGIN;
DO $$
DECLARE x1 integer; x2 integer; pao integer; queijo integer;
BEGIN
 IF EXISTS (SELECT 1 FROM tb_lanches WHERE nm_lanche LIKE 'QA-TM-%')
 OR EXISTS (SELECT 1 FROM tb_bebidas WHERE nm_bebida LIKE 'QA-TM-%')
 OR EXISTS (SELECT 1 FROM tb_ingredientes WHERE nm_ingrediente LIKE 'QA-TM-%') THEN
  RAISE EXCEPTION 'Massa QA-TM já existe. Não reaplicar; confira os registros existentes.';
 END IF;
 INSERT INTO tb_lanches(nm_lanche,descricao,valor_venda,fg_ativo)
 VALUES ('QA-TM-X1','Teste lanche um',10.00,1) RETURNING id_lanche INTO x1;
 INSERT INTO tb_lanches(nm_lanche,descricao,valor_venda,fg_ativo)
 VALUES ('QA-TM-X2','Teste lanche dois',12.50,1) RETURNING id_lanche INTO x2;
 INSERT INTO tb_lanches(nm_lanche,descricao,valor_venda,fg_ativo)
 VALUES ('QA-TM-X0','Teste lanche inativo',9.00,0);
 INSERT INTO tb_bebidas(nm_bebida,descricao,quantidade,valor_compra,valor_venda,tipo,fg_ativo)
 VALUES ('QA-TM-Suco','Teste suco',10,2.00,5.00,'suco',1),
        ('QA-TM-Refri','Teste refri',10,3.00,7.50,'refrigerante',1),
        ('QA-TM-B0','Teste bebida inativa',10,1.00,3.00,'suco',0);
 INSERT INTO tb_ingredientes(nm_ingrediente,descricao,quantidade,valor_compra,valor_venda,tipo,fg_ativo)
 VALUES ('QA-TM-Pao','Teste pao',100,1.00,2.00,'pao',1) RETURNING id_ingrediente INTO pao;
 INSERT INTO tb_ingredientes(nm_ingrediente,descricao,quantidade,valor_compra,valor_venda,tipo,fg_ativo)
 VALUES ('QA-TM-Queijo','Teste queijo',100,1.00,2.00,'queijo',1) RETURNING id_ingrediente INTO queijo;
 INSERT INTO tb_ingredientes_lanche(id_lanche,id_ingrediente,quantidade)
 VALUES(x1,pao,1),(x1,queijo,1),(x2,queijo,1);
 INSERT INTO tb_status_lanchonete(status) VALUES('ABERTO');
END $$;
COMMIT;
