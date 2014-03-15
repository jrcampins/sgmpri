create or replace function nodo_indice$update$peso(_nodo$ bigint) returns void as $$
declare
begin
    update nodo_indice set peso = null where id = _nodo$;
end;
$$ language plpgsql;
