create or replace function variable$after_insert_row$100() returns trigger as $$
declare
    enum_tipo_variable RECORD;
begin
    enum_tipo_variable := tipo_variable$enum();
    if new.tipo_variable = enum_tipo_variable.INTANGIBLE then
        insert into rango_variable (id, variable, numero, nombre)
        select bigintid(), new.id, numero, 'RANGO#'||numero
        from generate_series(new.rango_minimo_x2, new.rango_maximo_x2) as numero
        order by 1;
    end if;
    return null;
end;
$$ language plpgsql;
