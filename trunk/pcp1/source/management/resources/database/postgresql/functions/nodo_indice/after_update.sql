create or replace function nodo_indice$after_update_row$100() returns trigger as $$
declare
    _enum_tipo_nodo RECORD;
    _diff_tipo_nodo boolean := false;
    _diff_superior  boolean := false;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    if new.tipo_nodo <> old.tipo_nodo then
        if new.tipo_nodo = _enum_tipo_nodo.HOJA then
            _diff_tipo_nodo := true;
            delete from color_nodo_indice where nodo = new.id;
            delete from razon_nodo_indice where nodo = new.id;
        elsif old.tipo_nodo = _enum_tipo_nodo.HOJA then
            _diff_tipo_nodo := true;
            perform nodo_indice$insert$colores(new.id);
        end if;
    end if;
    if old.superior is null then
        if new.superior is not null then
            _diff_superior := true;
            perform nodo_indice$insert$razones(new.superior);
            /*
            perform nodo_indice$update$peso_ahp(new.superior);
            perform nodo_indice$update$peso_simplificado(new.superior);
            */
        end if;
    else
        if new.superior is null then
            _diff_superior := true;
            delete from razon_nodo_indice where nodo = old.superior and (numerador = new.id or denominador = new.id);
            /*
            perform nodo_indice$update$peso_ahp(old.superior);
            perform nodo_indice$update$peso_simplificado(old.superior);
            */
        elsif new.superior <> old.superior then
            _diff_superior := true;
            delete from razon_nodo_indice where nodo = old.superior and (numerador = new.id or denominador = new.id);
            /*
            perform nodo_indice$update$peso_ahp(old.superior);
            perform nodo_indice$update$peso_simplificado(old.superior);
            */
            perform nodo_indice$insert$razones(new.superior);
            /*
            perform nodo_indice$update$peso_ahp(new.superior);
            perform nodo_indice$update$peso_simplificado(new.superior);
            */
        /*
        elsif new.impacto <> old.impacto then
            perform nodo_indice$update$peso_simplificado(new.superior);
        */
        end if;
    end if;
    if _diff_tipo_nodo is true or _diff_superior is true then -- or new.codigo <> old.codigo or new.nombre <> old.nombre
        perform nodo_indice$delete$elemento_segmento(new.id);
        if new.tipo_nodo <> _enum_tipo_nodo.HOJA then
            perform nodo_indice$insert$segmento(new.id, new.codigo, new.nombre, new.superior);
        end if;
    end if;
    return null;
end;
$$ language plpgsql;
