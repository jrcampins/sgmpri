insert into seudo_variable_intangible (id, codigo, nombre, tipo_variable, rango_minimo_x2, rango_maximo_x2)
select
    id as id,
    'VI'||id as codigo,
    'Variable Intangible #'||id as nombre,
    2 as tipo_variable,
    0 as rango_minimo_x2,
    4 as rango_maximo_x2
from generate_series(101::bigint, 150::bigint) as id
order by 1;

insert into seudo_variable_tangible (id, codigo, nombre, tipo_variable, tipo_valor_x1)
select
    id as id,
    'VT'||id as codigo,
    'Variable Tangible #'||id as nombre,
    1 as tipo_variable,
    util.some_tipo_valor_variable(0) as tipo_valor_x1
from generate_series(201::bigint, 250::bigint) as id
order by 1;

