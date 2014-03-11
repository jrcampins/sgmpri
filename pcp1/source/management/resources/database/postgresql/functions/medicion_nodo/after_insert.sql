create or replace function medicion_nodo$after_insert_row$100() returns trigger as $$
declare
begin
    perform medicion_fuente$insert(new.id, new.nodo, new.programador, new.fecha_programada);
    return null;
end;
$$ language plpgsql;
