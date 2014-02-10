truncate table valor_nodo_indice cascade;
truncate table medicion_variable cascade;
truncate table medicion cascade;

-- -----------------------------------------------------------------------------------------------------------
-- medicion
-- -----------------------------------------------------------------------------------------------------------
insert into medicion (id, cuestionario, fuente)
select bigintid() as id, cuestionario, fuente
from cuestionario_fuente
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- medicion_variable
-- -----------------------------------------------------------------------------------------------------------
insert into medicion_variable (id, medicion, variable)
select bigintid() as id, m.id as medicion, cv.variable as variable
from medicion m inner join cuestionario_variable cv on cv.cuestionario = m.cuestionario
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- valor_nodo_indice
-- -----------------------------------------------------------------------------------------------------------
insert into valor_nodo_indice (id, nodo, fecha_valor)
select bigintid() as id, id as nodo, current_date as fecha_valor
from nodo_indice
where tipo_nodo <> 3
order by 1;
