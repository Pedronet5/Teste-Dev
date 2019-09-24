
--Clientes
INSERT INTO CLIENTES (ID_CLIENTE, NOME, UF, CELULAR)
VALUES (SEQ_ID_CLIENTE.NEXTVAL, 'Pedro Henrique', 'SP', '11975075589');
INSERT INTO CLIENTES (ID_CLIENTE, NOME, UF, CELULAR)
VALUES (SEQ_ID_CLIENTE.NEXTVAL, 'Maria da Graça', 'SP', '11974089565');
INSERT INTO CLIENTES (ID_CLIENTE, NOME, UF, CELULAR)
VALUES (SEQ_ID_CLIENTE.NEXTVAL, 'Mauro Messias', 'SP', '11945632587');
INSERT INTO CLIENTES (ID_CLIENTE, NOME, UF, CELULAR)
VALUES (SEQ_ID_CLIENTE.NEXTVAL, 'Milena Aparecida', 'MG', '11995633654');
INSERT INTO CLIENTES (ID_CLIENTE, NOME, UF, CELULAR)
VALUES (SEQ_ID_CLIENTE.NEXTVAL, 'João Henrique', 'SP', '11985626398');
 
 --Tipo Financiamentos
INSERT INTO TIPO_FINANCIAMENTO (ID_TIPO_FINANCIAMENTO, DESCRICAO)
VALUES (SEQ_ID_TIPO_FINANCIAMENTO.NEXTVAL, 'Credito Direto - Taxa de 2% ao mês.');
INSERT INTO TIPO_FINANCIAMENTO (ID_TIPO_FINANCIAMENTO, DESCRICAO)
VALUES (SEQ_ID_TIPO_FINANCIAMENTO.NEXTVAL, 'Credito Consignado - Taxa de 1% ao mês.');
INSERT INTO TIPO_FINANCIAMENTO (ID_TIPO_FINANCIAMENTO, DESCRICAO)
VALUES (SEQ_ID_TIPO_FINANCIAMENTO.NEXTVAL, 'Credito Pessoa Jurídica - Taxa de 5% ao mês.');
INSERT INTO TIPO_FINANCIAMENTO (ID_TIPO_FINANCIAMENTO, DESCRICAO)
VALUES (SEQ_ID_TIPO_FINANCIAMENTO.NEXTVAL, 'Credito Pessoa Física - Taxa de 3% ao mês.');
INSERT INTO TIPO_FINANCIAMENTO (ID_TIPO_FINANCIAMENTO, DESCRICAO)
VALUES (SEQ_ID_TIPO_FINANCIAMENTO.NEXTVAL, 'Credito Imobiliário - Taxa de 9% ao ano.');
 
 --Financiamentos
INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 1, 3, 16000, TO_DATE('14/05/21'));

INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 2, 1, 5500, TO_DATE('20/03/20'));

INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 3, 4, 7000, TO_DATE('21/11/19'));

INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 4, 2, 4000, TO_DATE('21/11/19'));

INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 1, 2, 20000, TO_DATE('02/08/20'));

INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 3, 4, 12000, TO_DATE('09/01/21'));

INSERT INTO FINANCIAMENTOS (ID_FINANCIAMENTO, ID_CLIENTE, TIPO_FINANCIAMENTO, VALOR_TOTAL, DATA_VENCIMENTO)
VALUES (SEQ_ID_FINANCIAMENTO.NEXTVAL, 5, 3, 800000, TO_DATE('02/08/20'));

--Parcelas
DECLARE 
    x number := 0;
    somaData number := 30;
BEGIN
    LOOP
        x := x + 1;
        INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
        VALUES (seq_id_parcela.NEXTVAL, 1, x, 800, sysdate + somaData);
        
        somaData := somaData + 30;
        EXIT WHEN x >= 20;
    END LOOP;
    commit;
END;

INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 1, 500, sysdate - 90);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 2, 500, sysdate - 60);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 3, 500, sysdate - 30);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 4, 500, sysdate);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 5, 500, sysdate + 30);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 6, 500, sysdate + 60);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 7, 500, sysdate + 90);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 8, 500, sysdate + 120);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 9, 500, sysdate + 150);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 2, 10, 500, sysdate + 180);

INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 1, 700, sysdate - 210, sysdate - 210 -2);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 2, 700, sysdate - 180, sysdate - 180 -1);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 3, 700, sysdate - 150, sysdate - 150 - 1);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 4, 700, sysdate - 120, sysdate - 120 -3);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 5, 700, sysdate - 90, sysdate - 90 -1);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 6, 700, sysdate - 60, sysdate - 60 -1 );
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento, data_pagamento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 7, 700, sysdate - 30, sysdate - 30 -1);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 8, 700, sysdate );
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 9, 700, sysdate + 30);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 3, 10, 700, sysdate + 60);

INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 4, 1, 116.70, sysdate - 90);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 4, 2, 116.66, sysdate - 60);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 4, 3, 116.66, sysdate - 30);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 4, 4, 116.66, sysdate);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 4, 5, 116.66, sysdate + 30);
INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
VALUES (seq_id_parcela.NEXTVAL, 4, 6, 116.66, sysdate + 60);
 
DECLARE 
    x number := 0;
    somaData number := 15;
    dtVencimento date := '10/05/2019';
BEGIN
    LOOP
        x := x + 1;
        INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
        VALUES (seq_id_parcela.NEXTVAL, 5, x, 1000, dtVencimento + somaData);
        
        somaData := somaData + 15;
        EXIT WHEN x >= 30;
    END LOOP;
    commit;
END;
 
 UPDATE PARCELAS SET DATA_PAGAMENTO = DATA_VENCIMENTO + 11
 WHERE ID_PARCELA IN(116,117,118,119,120,121,122);
 
DECLARE 
    x number := 0;
    somaData number := 20;
    dtVencimento date := '10/04/2019';
BEGIN
    LOOP
        x := x + 1;
        INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
        VALUES (seq_id_parcela.NEXTVAL, 6, x, 375, dtVencimento + somaData);
        
        somaData := somaData + 20;
        EXIT WHEN x >= 32;
    END LOOP;
    commit;
END;

DECLARE 
    x number := 0;
    somaData number := 20;
    dtVencimento date := '10/01/2019';
BEGIN
    LOOP
        x := x + 1;
        INSERT INTO parcelas (id_parcela, id_financiamento, numero_parcela, valor_parcela, data_vencimento) 
        VALUES (seq_id_parcela.NEXTVAL, 7, x, 2000, dtVencimento + somaData);
        
        somaData := somaData + 20;
        EXIT WHEN x >= 40;
    END LOOP;
    commit;
END;


update parcelas set data_pagamento = DATA_VENCIMENTO - 11
where NUMERO_PARCELA between 1 and 12  and id_financiamento = 7;
 
 
 