truncate documento_prueba cascade;
truncate parametro_linea_prueba cascade;
truncate ejecucion_linea_prueba cascade;
truncate ejecucion_prueba cascade;
truncate linea_prueba cascade;
truncate programa_prueba cascade;
truncate escenario_prueba cascade;
truncate caso_prueba cascade;
truncate paquete_prueba cascade;
truncate parte_ambiente_prueba cascade;
truncate ambiente_prueba cascade;
truncate pieza_ambiente_prueba cascade;

-- -----------------------------------------------------------------------------------------------------------
-- pieza_ambiente_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into pieza_ambiente_prueba (id, codigo, nombre) values (bigintid(), 'adalid', 'Adalid');
insert into pieza_ambiente_prueba (id, codigo, nombre) values (bigintid(), 'meta-jee1', 'meta-jee1');
insert into pieza_ambiente_prueba (id, codigo, nombre) values (bigintid(), 'jee1ap101', 'jee1ap101');
insert into pieza_ambiente_prueba (id, codigo, nombre) values (bigintid(), 'java', 'Java Platform, Enterprise Edition');
insert into pieza_ambiente_prueba (id, codigo, nombre) values (bigintid(), 'glassfish', 'GlassFish Application Server');
insert into pieza_ambiente_prueba (id, codigo, nombre) values (bigintid(), 'postgresql', 'PostgreSQL Database Server');
-- -----------------------------------------------------------------------------------------------------------
-- ambiente_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into ambiente_prueba (id, codigo, nombre, actual) values (bigintid(), 'A1', 'Ambiente #1', true);
-- -----------------------------------------------------------------------------------------------------------
-- paquete_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into paquete_prueba (id, codigo, nombre)
select bigintid() as id, p.codigo as codigo, replace(p.codigo, '.', ' ') as nombre
from (select distinct paquete_clase_recurso as codigo from clase_recurso order by 1) p
where p.codigo not in (
--  'meta.entidad.comun.auditoria',
    'meta.entidad.comun.configuracion.basica',
--  'meta.entidad.comun.control.acceso',
    'meta.entidad.comun.control.prueba',
--  'meta.entidad.comun.operacion.basica',
    'meta.entidad.comun'
)
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- caso_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into caso_prueba (id, codigo, nombre, descripcion, paquete, funcion, propietario)
select
    bigintid() as id,
    left(f.codigo_funcion, 60) as codigo,
    left(f.nombre_funcion, 100) as nombre,
    f.descripcion_funcion as descripcion,
    p.id as paquete,
    f.id_funcion as funcion,
    u.id_usuario as propietario
from funcion f
inner join dominio d on d.id_dominio = f.id_dominio
inner join clase_recurso c on c.id_clase_recurso = d.id_clase_recurso
inner join paquete_prueba p on p.codigo = c.paquete_clase_recurso
inner join usuario u on codigo_usuario = 'admin'
where f.numero_tipo_funcion <> 21
and f.es_programatica is false
and c.numero_tipo_recurso not in (11, 12)
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- escenario_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into escenario_prueba (id, numero, nombre, descripcion, tipo_resultado, caso)
select
    bigintid() as id,
    row_number() over (partition by c.id order by t.numero desc) as numero,
    t.codigo||': '||c.codigo as nombre,
    c.descripcion as descripcion,
    t.numero as tipo_resultado,
    c.id as caso
from caso_prueba as c, tipo_resultado_prueba t, generate_series(1, 3) as gs
where gs > t.numero
order by 1;


-- -----------------------------------------------------------------------------------------------------------
-- programa_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into programa_prueba (id, codigo, nombre, descripcion, paquete, caso, propietario)
select
    bigintid() as id,
    c.codigo as codigo,
    c.nombre as nombre,
    c.descripcion as descripcion,
    c.paquete as paquete,
    c.id as caso,
    u.id_usuario as propietario
from caso_prueba as c
inner join usuario u on codigo_usuario = 'admin'
order by 1;

insert into programa_prueba (id, version, codigo, nombre, descripcion, paquete, propietario)
select
    bigintid() as id,
    1 as version,
    cr.codigo_clase_recurso as codigo,
    left(cr.nombre_clase_recurso, 100) as nombre,
    cr.descripcion_clase_recurso as descripcion,
    p.id as paquete,
    u.id_usuario as propietario
from clase_recurso as cr
inner join paquete_prueba p on p.codigo = cr.paquete_clase_recurso
inner join usuario u on codigo_usuario = 'admin'
where exists (select 1 from caso_prueba cp where cp.codigo like cr.codigo_clase_recurso||'.%')
order by 1;

insert into programa_prueba (id, version, codigo, nombre, descripcion, paquete, propietario)
select
    bigintid() as id,
    2 as version,
    p.codigo as codigo,
    p.nombre as nombre,
    p.descripcion as descripcion,
    p.id as paquete,
    u.id_usuario as propietario
from paquete_prueba p
inner join usuario u on codigo_usuario = 'admin'
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- linea_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into linea_prueba (id, version, numero, programa, subprograma)
select
    bigintid() as id,
    1 as version,
    row_number() over (partition by pp.id order by sp.codigo asc) as numero,
    pp.id as programa,
    sp.id as subprograma
from programa_prueba pp
inner join programa_prueba sp
on pp.caso is null and pp.version=1 and sp.caso is not null and sp.version=0 and sp.paquete = pp.paquete and sp.codigo like pp.codigo||'.%'
order by 1;

insert into linea_prueba (id, version, numero, programa, subprograma)
select
    bigintid() as id,
    2 as version,
    row_number() over (partition by pp.id order by sp.codigo asc) as numero,
    pp.id as programa,
    sp.id subprograma
from programa_prueba pp
inner join programa_prueba sp
on pp.caso is null and pp.version=2 and sp.caso is null and sp.version=1 and sp.paquete = pp.paquete
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- ejecucion_prueba
-- -----------------------------------------------------------------------------------------------------------
insert into ejecucion_prueba (id, nombre, programa, paquete, responsable)
select
    bigintid() as id,
    p.nombre as nombre,
    p.id as programa,
    p.paquete as paquete,
    u.id_usuario as responsable
from programa_prueba as p
inner join usuario u on codigo_usuario = 'admin'
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- caso_prueba
-- -----------------------------------------------------------------------------------------------------------
update caso_prueba c set funcion = null
from paquete_prueba p
where c.paquete = p.id and p.codigo = 'meta.entidad.comun.auditoria';

-- -----------------------------------------------------------------------------------------------------------
--  select paquete
-- -----------------------------------------------------------------------------------------------------------
      select 1, 'caso_prueba',      p.codigo, count(*) from caso_prueba      x inner join paquete_prueba p on p.id = x.paquete group by p.codigo
union select 2, 'programa_prueba',  p.codigo, count(*) from programa_prueba  x inner join paquete_prueba p on p.id = x.paquete group by p.codigo
union select 3, 'ejecucion_prueba', p.codigo, count(*) from ejecucion_prueba x inner join paquete_prueba p on p.id = x.paquete group by p.codigo
order by 1, 3;
