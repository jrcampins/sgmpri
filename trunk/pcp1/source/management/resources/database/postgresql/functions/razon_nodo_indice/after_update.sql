create or replace function razon_nodo_indice$after_update_row$100() returns trigger as $$
declare
    _razon numeric;
    _editable boolean := false;
begin
    if old.editable is true then
        if new.razon is not null and new.razon > 0 then
            _razon := 1/new.razon;
        end if;
        if new.editable is false then
            _editable := true;
        end if;
        update razon_nodo_indice
        set razon=_razon, editable=_editable
        where nodo = new.nodo
        and numerador = new.denominador
        and denominador = new.numerador
        and editable is false;
    end if;
    if (new.razon is not null or old.razon is not null) and (new.razon is null or old.razon is null or new.razon <> old.razon) then
        perform nodo_indice$update$peso(new.nodo);
    end if;
    return null;
end;
$$ language plpgsql;
