truncate table cuestionario_variable cascade;
insert into cuestionario_variable (id, cuestionario, variable)
select bigintid() as id, c.id as cuestionario, v.id as variable
from cuestionario c, variable v
where v.tipo_variable=2 and v.id%1000 between 10*(c.id%1000)-9 and 10*(c.id%1000)
order by 1;
