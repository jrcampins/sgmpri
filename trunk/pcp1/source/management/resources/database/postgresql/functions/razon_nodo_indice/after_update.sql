create or replace function razon_nodo_indice$after_update_row$100() returns trigger as $$
declare
    _msg character varying;
    _razon_inversa integer;
begin
    if old.editable is true then
        if new.ordinal_razon <> old.ordinal_razon or new.editable is false then
            select inversa from ordinal_razon into _razon_inversa where numero = new.ordinal_razon;
            if not found then
                _msg := format(gettext('no existe %s con %s = %s'), 'ordinal de razon', 'numero', new.ordinal_razon);
                raise exception using message = _msg;
            end if;
            update razon_nodo_indice
            set ordinal_razon = _razon_inversa, editable = not(new.editable)
            where nodo = new.nodo
            and numerador = new.denominador
            and denominador = new.numerador
            and editable is false;
        end if;
    end if;
    return null;
end;
$$ language plpgsql;
