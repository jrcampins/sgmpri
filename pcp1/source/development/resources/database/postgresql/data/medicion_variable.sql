truncate table medicion_variable cascade;
insert into medicion_variable (id, medicion, variable)
select bigintid() as id, m.id as medicion, cv.variable as variable
from medicion m
inner join cuestionario_variable cv on cv.cuestionario = m.cuestionario
order by 1;
