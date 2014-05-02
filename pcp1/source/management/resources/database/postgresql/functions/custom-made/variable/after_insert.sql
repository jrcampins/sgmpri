create or replace function variable$after_insert_row$100() returns trigger as $$
begin
    insert into rango_variable (id, variable, numeral, expresion)
    select bigintid(), new.id, numeral, numeral||'. RANGO #'||numeral
    from generate_series(new.rango_minimo, new.rango_maximo) as numeral
    order by 1;
    return null;
end;
$$ language plpgsql;
