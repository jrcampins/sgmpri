truncate table valor_nodo_indice cascade;
truncate table medicion_variable cascade;
truncate table medicion cascade;
truncate table nodo_indice cascade;
truncate table variable cascade;
truncate table fuente cascade;

-- -----------------------------------------------------------------------------------------------------------
-- fuente
-- -----------------------------------------------------------------------------------------------------------
insert into fuente (id, codigo, nombre)
select id as id, 'F#'||id as codigo, 'Fuente #'||id as nombre
from generate_series(1001::bigint, 1100::bigint) as id
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
-- nodo_indice
-- -----------------------------------------------------------------------------------------------------------
insert into nodo_indice (id, codigo, nombre, tipo_nodo)
select id, 'INS#'||lpad(''||id, 4, '0') as codigo, 'Indice del Nivel de Seguridad #'||lpad(''||id, 4, '0') as nombre, 1 as tipo_nodo
from generate_series(1::bigint, 10::bigint) as id
order by 1;

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
select f.id as id, n.codigo||'-'||f.codigo as codigo, 'Componente '||f.codigo as nombre, 2 as tipo_nodo, n.id as superior
from nodo_indice n, fuente f
where n.tipo_nodo=1 and f.id%1000 between 10*n.id-9 and 10*n.id
order by 1;

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, fuente, variable)
select bigintid() as id, n.codigo||'-'||v.codigo as codigo, v.nombre, 3 as tipo_nodo, n.id as superior, n.id as fuente, v.id as variable
from nodo_indice n, variable v
where n.tipo_nodo=2 and v.tipo_variable=2 and v.id%1000 between 10*(n.superior%1000)-9 and 10*(n.superior%1000)
order by 1;
