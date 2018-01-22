SET TERM ^ ;

create or alter procedure produto_insert 
returns (
    retorno integer)
as
begin
  /* Procedure Text */
    retorno = 0;
    INSERT INTO produto
    (dtinsert,isdelete)
     VALUES 
    (current_timestamp,false)
    returning id INTO retorno;
    /*return retorno;*/
    suspend;
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT INSERT ON PRODUTO TO PROCEDURE PRODUTO_INSERT;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE PRODUTO_INSERT TO SYSDBA;