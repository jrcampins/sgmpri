drop view if exists medicion_nodo$chart1 cascade;
create view medicion_nodo$chart1 as
select
    vni.id,
    vni.medicion, mn.codigo as codigo_medicion, mn.nombre as nombre_medicion, mn.fecha_condicion as fecha_medicion,
    vni.nodo, ni.codigo as codigo_nodo, ni.nombre as nombre_nodo,
    vni.respuestas
from valor_nodo_indice vni
inner join medicion_nodo mn on mn.id=vni.medicion
inner join nodo_indice ni on ni.id=vni.nodo
where vni.tipo_nodo<>3 and mn.condicion=3
order by mn.codigo, ni.codigo;
