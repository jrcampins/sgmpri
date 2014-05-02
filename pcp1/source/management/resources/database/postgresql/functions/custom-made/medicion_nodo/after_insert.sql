create or replace function medicion_nodo$after_insert_row$100() returns trigger as $$
declare
    _superior bigint := null;
begin
    perform medicion_rama$insert(new.id, new.nodo);
    perform valor_nodo_indice$insert(new.id, new.nodo, _superior, new.fecha_programacion);
    return null;
end;
$$ language plpgsql;
