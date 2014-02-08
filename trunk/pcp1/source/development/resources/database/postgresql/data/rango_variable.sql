truncate table rango_variable cascade;
insert into rango_variable (id, variable, numero, nombre)
select bigintid() as id, var.id as variable, numero, 'RANGO#'||numero as nombre
from variable var, generate_series(0, 9) as numero
where numero between var.rango_minimo_x2 and var.rango_maximo_x2
order by 1;
