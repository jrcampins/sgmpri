create or replace function nodo_indice$after_insert_row$100() returns trigger as $$
declare
    _enum_tipo_nodo RECORD;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    if new.tipo_nodo <> _enum_tipo_nodo.HOJA then
        perform nodo_indice$insert$colores(new.id);
        perform nodo_indice$insert$segmento(new.id, new.codigo, new.nombre, new.superior);
    end if;
    if new.superior is not null then
        perform nodo_indice$insert$razones(new.superior);
        perform nodo_indice$ae$razon_nodo_indice(new.superior);
    end if;
    return null;
end;
$$ language plpgsql;
