truncate table medicion cascade;
insert into medicion (id, cuestionario, instalacion, fecha_programada)
select bigintid() as id, cuestionario, instalacion, current_date as fecha_programada
from cuestionario_instalacion
order by 1;
