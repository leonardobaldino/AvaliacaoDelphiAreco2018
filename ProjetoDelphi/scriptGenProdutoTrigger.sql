SET SQL DIALECT 3;


CREATE GENERATOR GEN_PRODUTO_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER PRODUTO_BI FOR PRODUTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_produto_id,1);
end
^

SET TERM ; ^
