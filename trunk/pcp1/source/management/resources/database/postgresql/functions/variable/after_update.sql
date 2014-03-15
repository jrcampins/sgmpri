create or replace function variable$after_update_row$100() returns trigger as $$
begin
    if new.rango_minimo <> old.rango_minimo or new.rango_maximo <> old.rango_maximo then
        delete from rango_variable where variable = new.id and numeral not between new.rango_minimo and new.rango_maximo;
        insert into rango_variable (id, variable, numeral, expresion)
        select bigintid(), new.id, numeral, numeral||'. RANGO #'||numeral
        from generate_series(new.rango_minimo, new.rango_maximo) as numeral
        where numeral not in (select numeral from rango_variable where variable = new.id)
        order by 1;
    end if;
    return null;
end;
$$ language plpgsql;
