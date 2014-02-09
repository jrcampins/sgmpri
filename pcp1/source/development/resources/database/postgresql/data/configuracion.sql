truncate table cuestionario_variable cascade;
truncate table cuestionario_instalacion cascade;
truncate table rango_variable cascade;

-- -----------------------------------------------------------------------------------------------------------
-- rango_variable
-- -----------------------------------------------------------------------------------------------------------
insert into rango_variable (id, variable, numero, nombre)
select bigintid() as id, var.id as variable, numero, var.codigo||'#'||numero as nombre
from variable var, generate_series(0, 9) as numero
where numero between var.rango_minimo_x2 and var.rango_maximo_x2
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- cuestionario_instalacion
-- -----------------------------------------------------------------------------------------------------------
insert into cuestionario_instalacion (id, cuestionario, instalacion, periodo, fecha_primera_medicion)
select bigintid() as id, c.id as cuestionario, v.id as instalacion, 3 as periodo, current_date as fecha_primera_medicion
from cuestionario c, instalacion v
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- cuestionario_variable
-- -----------------------------------------------------------------------------------------------------------
insert into cuestionario_variable (id, cuestionario, variable)
select bigintid() as id, c.id as cuestionario, v.id as variable
from cuestionario c, variable v
where v.tipo_variable=2 and v.id%1000 between 10*(c.id%1000)-9 and 10*(c.id%1000)
order by 1;
