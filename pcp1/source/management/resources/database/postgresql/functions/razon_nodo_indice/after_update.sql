create or replace function razon_nodo_indice$after_update_row$100() returns trigger as $$
declare
    _msg character varying;
    _razon_inversa integer;
begin
    if old.editable is true then
        if new.ordinal_razon <> old.ordinal_razon then
            update razon_nodo_indice
            set ordinal_razon = ordinal_razon.inversa
            from ordinal_razon
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.denominador
            and razon_nodo_indice.denominador = new.numerador
            and razon_nodo_indice.ordinal_razon <> ordinal_razon.inversa
            and razon_nodo_indice.editable is false
            and ordinal_razon.numero = new.ordinal_razon;
        end if;
        /*
        if new.editable is false then
            update razon_nodo_indice
            set editable = true
            where nodo = new.nodo
            and numerador = new.denominador
            and denominador = new.numerador
            and editable is false;
        end if;
        */
    end if;
    return null;
end;
$$ language plpgsql;
