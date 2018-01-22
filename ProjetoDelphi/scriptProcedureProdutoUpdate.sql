SET TERM ^ ;

create or alter procedure produto_update (
    pcamponome varchar(200),
    pbigint bigint,
    pboolean boolean,
    pnumeric numeric(15,3),
    ptext varchar(200),
    pid integer,
    pblob blob sub_type 0 segment size 150)
as
begin
  /* Procedure Text */
    if (pcamponome = 'CODIGOBARRA') then
    begin
        UPDATE produto SET CODIGOBARRA=:ptext WHERE id=:pid;
    end

    if (pcamponome = 'UNIDADE') then
    begin
        UPDATE produto SET UNIDADE=:ptext WHERE id=:pid;
    end

    if (pcamponome = 'PESO') then
    begin
        UPDATE produto SET PESO=:pnumeric WHERE id=:pid;
    end

    if (pcamponome = 'DESCRICAO') then
    begin
        UPDATE produto SET DESCRICAO=:ptext WHERE id=:pid;
    end

    if (pcamponome = 'ESTOQUEMINIMO') then
    begin
        UPDATE produto SET ESTOQUEMINIMO=:pnumeric WHERE id=:pid;
    end

    if (pcamponome = 'ESTOQUEMAXIMO') then
    begin
        UPDATE produto SET ESTOQUEMAXIMO=:pnumeric WHERE id=:pid;
    end

    if (pcamponome = 'ESTOQUEATUAL') then
    begin
        UPDATE produto SET ESTOQUEATUAL=:pnumeric WHERE id=:pid;
    end

  suspend;
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT SELECT,UPDATE ON PRODUTO TO PROCEDURE PRODUTO_UPDATE;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE PRODUTO_UPDATE TO SYSDBA;