create or replace function nodo_indice$after_delete_row$100() returns trigger as $$
begin
    perform nodo_indice$delete$elemento_segmento(old.id);
    if old.superior is not null then
        perform nodo_indice$ae$razon_nodo_indice(old.superior);
    end if;
    return null;
end;
$$ language plpgsql;
