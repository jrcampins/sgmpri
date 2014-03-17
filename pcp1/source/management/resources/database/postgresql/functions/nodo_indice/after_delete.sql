create or replace function nodo_indice$after_delete_row$100() returns trigger as $$
begin
    perform nodo_indice$delete$elemento_segmento(old.id);
    return null;
end;
$$ language plpgsql;
