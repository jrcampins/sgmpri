create or replace function variable$after_update_row$100() returns trigger as $$
declare
    enum_tipo_variable RECORD;
begin
    enum_tipo_variable := tipo_variable$enum();
    if new.tipo_variable = enum_tipo_variable.INTANGIBLE then
        delete from rango_variable where variable = new.id and numero not between new.rango_minimo_x2 and new.rango_maximo_x2;
        insert into rango_variable (id, variable, numero, nombre)
        select bigintid(), new.id, numero, numero||'. RANGO #'||numero
        from generate_series(new.rango_minimo_x2, new.rango_maximo_x2) as numero
        where numero not in (select numero from rango_variable where variable = new.id)
        order by 1;
    elsif old.tipo_variable = enum_tipo_variable.INTANGIBLE then
        delete from rango_variable where variable = new.id;
    end if;
    return null;
end;
$$ language plpgsql;
