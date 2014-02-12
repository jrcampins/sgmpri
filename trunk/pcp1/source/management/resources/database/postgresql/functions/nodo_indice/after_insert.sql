create or replace function nodo_indice$after_insert_row$100() returns trigger as $$
declare
    _enum_tipo_nodo RECORD;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    if new.tipo_nodo <> _enum_tipo_nodo.HOJA then
        insert into color_nodo_indice (id, nodo, color, extremo_inferior)
        select bigintid(), new.id, id, extremo_inferior
        from color_indice
        order by 1;
    end if;
    return null;
end;
$$ language plpgsql;
