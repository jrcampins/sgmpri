create or replace function medicion_nodo$recalcular$biz(_super$ bigint, _medicion$ bigint) returns integer as $$
declare
    _msg character varying;
begin
    raise notice 'medicion_nodo$recalcular$biz(%, %)', _super$, _medicion$;
    perform medicion_nodo$calcular(_row.medicion);
    return 0;
end;
$$ language plpgsql;
