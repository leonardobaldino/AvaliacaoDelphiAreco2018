SET TERM ^ ;

create or alter procedure produto_delete (
    pid integer)
as
begin
  /* Procedure Text */
  delete from produto where id = :pid;
  suspend;
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT SELECT,DELETE ON PRODUTO TO PROCEDURE PRODUTO_DELETE;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE PRODUTO_DELETE TO SYSDBA;