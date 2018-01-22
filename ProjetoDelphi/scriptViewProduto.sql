CREATE OR ALTER VIEW VIEW_PRODUTO(
    ID,
    CODIGOBARRA,
    UNIDADE,
    PESO,
    DESCRICAO,
    ESTOQUEMINIMO,
    ESTOQUEMAXIMO,
    ESTOQUEATUAL)
AS
SELECT produto.id,
    produto.codigobarra,
    produto.unidade,
    produto.peso,
    produto.descricao,
    produto.estoqueminimo,
    produto.estoquemaximo,
    produto.estoqueatual
   FROM PRODUTO
  WHERE PRODUTO.isdelete = false
;