create or replace function nodo_indice$after_update_row$100() returns trigger as $$
declare
    _enum_tipo_nodo RECORD;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    if new.tipo_nodo <> old.tipo_nodo then
        if new.tipo_nodo = _enum_tipo_nodo.HOJA then
            delete from color_nodo_indice where nodo = new.id;
            delete from razon_nodo_indice where nodo = new.id;
        elsif old.tipo_nodo = _enum_tipo_nodo.HOJA then
            perform nodo_indice$insert$colores(new.id);
        end if;
    end if;
    if old.superior is null then
        if new.superior is not null then
            perform nodo_indice$insert$razones(new.superior);
        end if;
    else
        if new.superior is null then
            delete from razon_nodo_indice where nodo = old.superior and (numerador = new.id or denominador = new.id);
        elsif new.superior <> old.superior then
            delete from razon_nodo_indice where nodo = old.superior and (numerador = new.id or denominador = new.id);
            perform nodo_indice$insert$razones(new.superior);
        end if;
    end if;
    return null;
end;
$$ language plpgsql;
