truncate table cuestionario_instalacion;
insert into cuestionario_instalacion (id, cuestionario, instalacion, periodo, fecha_primera_medicion)
select bigintid() as id, c.id as cuestionario, v.id as instalacion, 3 as periodo, current_date as fecha_primera_medicion
from cuestionario c, instalacion v
order by 1;
