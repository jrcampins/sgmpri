truncate table medicion_variable cascade;
truncate table medicion cascade;
truncate table cuestionario_variable cascade;
truncate table variable cascade;
truncate table cuestionario_fuente cascade;
truncate table fuente cascade;
truncate table cuestionario cascade;

-- -----------------------------------------------------------------------------------------------------------
-- cuestionario
-- -----------------------------------------------------------------------------------------------------------
insert into cuestionario (id, codigo, nombre)
select id as id, 'C#'||id as codigo, 'Cuestionario #'||id as nombre
from generate_series(1001::bigint, 1010::bigint) as id
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- fuente
-- -----------------------------------------------------------------------------------------------------------
insert into fuente (id, codigo, nombre)
select id as id, 'F#'||id as codigo, 'Fuente #'||id as nombre
from generate_series(1001::bigint, 1010::bigint) as id
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- cuestionario_fuente
-- -----------------------------------------------------------------------------------------------------------
insert into cuestionario_fuente (id, cuestionario, fuente, periodo, fecha_primera_medicion)
select bigintid() as id, c.id as cuestionario, v.id as fuente, 3 as periodo, current_date as fecha_primera_medicion
from cuestionario c, fuente v
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- variable
-- -----------------------------------------------------------------------------------------------------------
insert into seudo_variable_tangible (id, codigo, nombre, tipo_variable, tipo_valor_x1)
select
    id as id,
    'VT#'||id as codigo,
    'Variable Tangible #'||id as nombre,
    1 as tipo_variable,
    util.some_tipo_valor_variable(0) as tipo_valor_x1
from generate_series(1001::bigint, 1100::bigint) as id
order by 1;

insert into seudo_variable_intangible (id, codigo, nombre, tipo_variable, rango_minimo_x2, rango_maximo_x2)
select
    id as id,
    'VJ#'||id as codigo,
    'Variable Intangible #'||id as nombre,
    2 as tipo_variable,
    0 as rango_minimo_x2,
    4 as rango_maximo_x2
from generate_series(2001::bigint, 2100::bigint) as id
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- cuestionario_variable
-- -----------------------------------------------------------------------------------------------------------
insert into cuestionario_variable (id, cuestionario, variable)
select bigintid() as id, c.id as cuestionario, v.id as variable
from cuestionario c, variable v
where v.tipo_variable=2 and v.id%1000 between 10*(c.id%1000)-9 and 10*(c.id%1000)
order by 1;
