create or replace function nodo_indice$insert$colores(_nodo$ bigint) returns void as $$
declare
begin
    insert into color_nodo_indice (id, nodo, color, extremo_inferior)
    select bigintid(), _nodo$, id, extremo_inferior
    from color_indice
    order by 1;
end;
$$ language plpgsql;
