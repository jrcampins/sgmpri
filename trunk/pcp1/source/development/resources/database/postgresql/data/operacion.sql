truncate table medicion_variable cascade;
truncate table medicion cascade;

-- -----------------------------------------------------------------------------------------------------------
-- medicion
-- -----------------------------------------------------------------------------------------------------------
insert into medicion (id, cuestionario, instalacion)
select bigintid() as id, cuestionario, instalacion
from cuestionario_instalacion
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- medicion_variable
-- -----------------------------------------------------------------------------------------------------------
insert into medicion_variable (id, medicion, variable)
select bigintid() as id, m.id as medicion, cv.variable as variable
from medicion m inner join cuestionario_variable cv on cv.cuestionario = m.cuestionario
order by 1;