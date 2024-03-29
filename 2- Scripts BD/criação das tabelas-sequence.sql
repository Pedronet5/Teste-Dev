CREATE TABLE CLIENTES (
    ID_CLIENTE   NUMBER(15,0),
    NOME         VARCHAR2(255),
    UF           VARCHAR2(2),
    CELULAR      NUMBER(20));
    
 ALTER TABLE CLIENTES ADD CONSTRAINT ID_CLIENTE_PK PRIMARY KEY (ID_CLIENTE);   
 
 CREATE INDEX IDX_CLIENTES ON CLIENTES (
    ID_CLIENTE ASC, 
    NOME ASC,
    UF ASC
 );
    
COMMENT ON COLUMN CLIENTES.ID_CLIENTE IS 'C�DIGO ID DA TABELA';
COMMENT ON COLUMN CLIENTES.NOME IS 'NOME DO CLIENTE';
COMMENT ON COLUMN CLIENTES.UF IS 'ESTADO DO CLIENTE';
COMMENT ON COLUMN CLIENTES.CELULAR IS 'CELULAR DO CLIENTE';
    
CREATE SEQUENCE SEQ_ID_CLIENTE   
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE TABLE FINANCIAMENTOS (
      ID_FINANCIAMENTO NUMBER(15,0),
      ID_CLIENTE NUMBER(15,0),
      TIPO_FINANCIAMENTO NUMBER(10),
      VALOR_TOTAL NUMBER(16,2),
      DATA_VENCIMENTO DATE
 );
 
ALTER TABLE FINANCIAMENTOS ADD CONSTRAINT ID_FINANCIAMENTO_PK PRIMARY KEY (ID_FINANCIAMENTO);
  
CREATE INDEX IDX_FINANCIAMENTOS ON FINANCIAMENTOS (
    ID_FINANCIAMENTO ASC, 
    ID_CLIENTE ASC,
    TIPO_FINANCIAMENTO ASC,
    DATA_VENCIMENTO
 );
 
COMMENT ON COLUMN FINANCIAMENTOS.ID_FINANCIAMENTO IS 'C�DIGO ID DA TABELA';
COMMENT ON COLUMN FINANCIAMENTOS.ID_CLIENTE IS 'C�DIGO ID DO CLIENTE VINCULADO AO FINANCIAMENTO';
COMMENT ON COLUMN FINANCIAMENTOS.TIPO_FINANCIAMENTO IS 'C�DIGO DO TIPO DE FINANCIAMENTO';
COMMENT ON COLUMN FINANCIAMENTOS.VALOR_TOTAL IS 'VALOR TOTAL DO FINANCIAMENTO';
COMMENT ON COLUMN FINANCIAMENTOS.DATA_VENCIMENTO IS 'DATA DO VENCIMENTO DO FINANCIAMENTO';
 
CREATE SEQUENCE SEQ_ID_FINANCIAMENTO   
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE TABLE TIPO_FINANCIAMENTO (
    ID_TIPO_FINANCIAMENTO NUMBER(10),
    DESCRICAO VARCHAR2(3000)
 );
 
 ALTER TABLE TIPO_FINANCIAMENTO ADD CONSTRAINT ID_TIPO_FINANCIAMENTO_PK PRIMARY KEY (ID_TIPO_FINANCIAMENTO);
 
COMMENT ON COLUMN TIPO_FINANCIAMENTO.ID_TIPO_FINANCIAMENTO IS 'C�DIGO ID DA TABELA';
COMMENT ON COLUMN TIPO_FINANCIAMENTO.DESCRICAO IS 'DESCRICAO DO TIPO DE FINANCIAMENTO';
 
 CREATE SEQUENCE SEQ_ID_TIPO_FINANCIAMENTO
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE TABLE PARCELAS (
    ID_PARCELA NUMBER(15,0),
    ID_FINANCIAMENTO NUMBER(15,0),
    NUMERO_PARCELA NUMBER(10),
    VALOR_PARCELA NUMBER(16,2),
    DATA_VENCIMENTO DATE,
    DATA_PAGAMENTO DATE DEFAULT NULL
 );
 
ALTER TABLE PARCELAS ADD CONSTRAINT ID_PARCELA_PK PRIMARY KEY (ID_PARCELA, ID_FINANCIAMENTO);

CREATE INDEX IDX_PARCELAS ON PARCELAS (
    ID_PARCELA ASC,
    ID_FINANCIAMENTO ASC, 
    NUMERO_PARCELA ASC,
    DATA_VENCIMENTO ASC,
    DATA_PAGAMENTO ASC
 );

COMMENT ON COLUMN PARCELAS.ID_PARCELA IS 'C�DIGO ID DA TABELA'; 
COMMENT ON COLUMN PARCELAS.ID_FINANCIAMENTO IS 'C�DIGO ID VINCULADO AO FINANCIAMENTO'; 
COMMENT ON COLUMN PARCELAS.NUMERO_PARCELA IS 'N�MERO DA PARCELA'; 
COMMENT ON COLUMN PARCELAS.VALOR_PARCELA IS 'VALOR DA PARCELA'; 
COMMENT ON COLUMN PARCELAS.DATA_VENCIMENTO IS 'DATA DO VENCIMENTO DA PARCELA'; 
COMMENT ON COLUMN PARCELAS.DATA_PAGAMENTO IS 'DATA QUE O PAGAMENTO FOI REALIZADO'; 

 CREATE SEQUENCE SEQ_ID_PARCELA
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 
 

 
 
 