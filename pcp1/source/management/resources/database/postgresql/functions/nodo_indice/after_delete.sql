create or replace function nodo_indice$after_delete_row$100() returns trigger as $$
begin
    delete from elemento_segmento where id_elemento_segmento = old.id;
    return null;
end;
$$ language plpgsql;
