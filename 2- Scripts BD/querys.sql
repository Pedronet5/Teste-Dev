--Listar todos os clientes do estado de SP que tenham mais de 60% das parcelas pagas.
SELECT C.* FROM CLIENTES C
 INNER JOIN FINANCIAMENTOS F ON C.ID_CLIENTE = F.ID_CLIENTE
 WHERE UPPER(C.UF) = 'SP'
 AND f.id_financiamento in (SELECT id_financiamento FROM (
                                SELECT ID_FINANCIAMENTO, COUNT(1) * 100  QTDPAGAS, (SELECT COUNT(1) FROM PARCELAS WHERE id_financiamento = 3) QTDPARCELAS 
                                FROM PARCELAS
                                    WHERE id_financiamento = f.id_financiamento
                                    and data_pagamento IS NOT NULL
                                    GROUP BY ID_FINANCIAMENTO)
                                WHERE QTDPAGAS/QTDPARCELAS > 60) ;
 
 --- Listar os primeiros 4 clientes que tenham alguma parcela com mais de 05 dias atrasadas (Data Vencimento maior que data atual E data pagamento nula)
 SELECT C.ID_CLIENTE, C.NOME, C.UF, C.CELULAR FROM CLIENTES C
 INNER JOIN FINANCIAMENTOS F ON C.ID_CLIENTE = F.ID_CLIENTE
 INNER JOIN PARCELAS P ON F.ID_FINANCIAMENTO = P.ID_FINANCIAMENTO
 WHERE P.DATA_PAGAMENTO IS NULL
 AND P.DATA_VENCIMENTO < SYSDATE 
 AND SYSDATE-P.DATA_VENCIMENTO > 5
 GROUP BY C.ID_CLIENTE, C.NOME, C.UF, C.CELULAR
FETCH FIRST 4 ROWS ONLY;

--Listar todos os clientes que já atrasaram em algum momento duas ou mais parcelas em mais de 10 dias, e que o valor do financiamento seja maior que R$ 10.000,00.
SELECT C.ID_CLIENTE, C.NOME, C.UF, C.CELULAR FROM CLIENTES C
INNER JOIN FINANCIAMENTOS F ON C.ID_CLIENTE = F.ID_CLIENTE
INNER JOIN PARCELAS P ON F.ID_FINANCIAMENTO = P.ID_FINANCIAMENTO
WHERE F.VALOR_TOTAL > 10000
AND f.id_financiamento IN (SELECT ID_FINANCIAMENTO FROM (
                                SELECT ID_FINANCIAMENTO, COUNT(1) PARCELAS
                                FROM PARCELAS
                                WHERE f.id_financiamento = id_financiamento
                                AND DATA_PAGAMENTO IS NOT NULL
                                GROUP BY ID_FINANCIAMENTO)
                            WHERE PARCELAS > 2)
GROUP BY C.ID_CLIENTE, C.NOME, C.UF, C.CELULAR
ORDER BY C.NOME;
