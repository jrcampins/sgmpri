create or replace function nodo_indice$ae$razon_nodo_indice(_nodo$ bigint) returns bigint as $$
begin
    perform nodo_indice$update$razones(_nodo$);
    return _nodo$;
end;
$$ language plpgsql;

create or replace function nodo_indice$ae$seudo_fila_matriz_razon(_nodo$ bigint) returns bigint as $$
begin
    perform nodo_indice$update$razones(_nodo$);
    return _nodo$;
end;
$$ language plpgsql;
