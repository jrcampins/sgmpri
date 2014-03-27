create or replace function nodo_indice$ae$razon_nodo_indice(_nodo$ bigint) returns bigint as $$
begin
    perform nodo_indice$update$peso_ahp(_nodo$);
    return _nodo$;
end;
$$ language plpgsql;
