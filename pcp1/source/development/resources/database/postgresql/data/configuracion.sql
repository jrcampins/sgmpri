truncate table valor_nodo_indice cascade;
truncate table medicion_variable cascade;
truncate table medicion_fuente cascade;
truncate table medicion_nodo cascade;
truncate table nodo_indice cascade;
truncate table variable cascade;
truncate table fuente cascade;

-- -----------------------------------------------------------------------------------------------------------
-- fuente
-- -----------------------------------------------------------------------------------------------------------
/*
insert into fuente (id, codigo, nombre)
select id as id, 'F#'||lpad(''||id,4,'0') as codigo, 'Fuente #'||lpad(''||id,4,'0') as nombre
from generate_series(1::bigint, 10::bigint) as id
order by 1;
*/
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
    3 as rango_maximo_x2
from generate_series(2001::bigint, 2100::bigint) as id
order by 1;

-- -----------------------------------------------------------------------------------------------------------
-- nodo_indice
-- -----------------------------------------------------------------------------------------------------------
/*
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente)
select id, 'INS#'||lpad(''||id,4,'0') as codigo, 'Indice del Nivel de Seguridad #'||lpad(''||id,4,'0') as nombre, 1 as tipo_nodo, id as fuente
from generate_series(1::bigint, 10::bigint) as id
order by 1;

insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior)
select f.id as id, n.codigo||'-'||f.codigo as codigo, 'Componente '||f.codigo as nombre, 2 as tipo_nodo, f.id as fuente, n.id as superior
from nodo_indice n, fuente f
where n.tipo_nodo=1 and f.id>1000 and f.id%1000 between 10*n.id-9 and 10*n.id
order by 1;

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
select bigintid() as id, n.codigo||'-'||v.codigo as codigo, v.nombre, 3 as tipo_nodo, n.id as superior, v.id as variable
from nodo_indice n, variable v
where n.tipo_nodo=2 and v.tipo_variable=2 and v.id>1000 and v.id%1000 between 10*(n.superior%1000)-9 and 10*(n.superior%1000)
order by 1;
*/
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente) values (1000000, 'A00', 'P.T.O. - SAN TOMÉ', 1, 1010);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010000, 'A01', 'PROTECCIÓN FÍSICA', 2, 1010, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1020000, 'A02', 'SEGURIDAD INDUSTRIAL', 2, 1020, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1030000, 'A03', 'CONTINUIDAD OPERACIONAL', 2, 1030, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1040000, 'A04', 'INFRAESTRUCTURA OPERACIONAL', 2, 1040, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1050000, 'A05', 'INFRAESTRUCTURA TECNOLÓGICA', 2, 1050, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1060000, 'A06', 'ENTORNO SOCIAL', 2, 1060, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1070000, 'A07', 'OPERATIVIDAD CON LA FANB/OSC Y OTROS ENTES DEL ESTADO', 2, 1070, 1000000);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010100, 'A01-S01', 'BARRERAS Y RETARDOS', 2, 1011, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010200, 'A01-S02', 'DETECCIÓN', 2, 1012, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010300, 'A01-S03', 'EVALUACIÓN', 2, 1013, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010400, 'A01-S04', 'CONTROL Y MONITOREO', 2, 1014, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010500, 'A01-S05', 'COMUNICACIONES', 2, 1015, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010600, 'A01-S06', 'PERSONAL Y EQUIPO', 2, 1016, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010700, 'A01-S07', 'CONTROL Y ACCESO', 2, 1017, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, fuente, superior) values (1010800, 'A01-S08', 'NORMAS Y PROCEDIMIENTOS', 2, 1018, 1010000);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010101, 'A01-S01-V01', 'CERCA TIPO MALLA CICLÓN CON PUERTAS Y/O PORTONES', 3, 1010100, 2001);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010102, 'A01-S01-V02', 'CERCA TIPO REJA CON PUERTAS Y/O PORTONES', 3, 1010100, 2002);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010103, 'A01-S01-V03', 'CONO PROTECTOR ANTIESCALAMIENTO', 3, 1010100, 2003);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010104, 'A01-S01-V04', 'PAREDES DE BLOQUE O PREFABRICADO CON PUERTAS Y/O PORTONES', 3, 1010100, 2004);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010105, 'A01-S01-V05', 'MURO DE CONCRETO ARMADO CON PUERTAS Y/O PORTONES', 3, 1010100, 2005);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010201, 'A01-S02-V01', 'SISTEMAS DE DETECCIÓN INTERNO', 3, 1010200, 2006);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010202, 'A01-S02-V02', 'SISTEMAS DE DETECCIÓN PERIMETRAL', 3, 1010200, 2007);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010301, 'A01-S03-V01', 'PUNTOS DE EVALUACIÓN SIMPLE', 3, 1010300, 2008);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010302, 'A01-S03-V02', 'GARITA / TORRE', 3, 1010300, 2009);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010303, 'A01-S03-V03', 'RECORRIDO', 3, 1010300, 2010);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010304, 'A01-S03-V04', 'ILUMINACIÓN DE PROTECCIÓN', 3, 1010300, 2011);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010305, 'A01-S03-V05', 'SISTEMA DE VIDEO VIGILANCIA', 3, 1010300, 2012);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010306, 'A01-S03-V06', 'SOFTWARE DE EVALUACIÓN Y ANÁLISIS DE SISTEMAS AUTOMATIZADOS', 3, 1010300, 2013);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010401, 'A01-S04-V01', 'ESTACIÓN DE MONITOREO', 3, 1010400, 2014);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010402, 'A01-S04-V02', 'CENTRO DE CONTROL', 3, 1010400, 2015);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010501, 'A01-S05-V01', 'SISTEMA DE VOCEO', 3, 1010500, 2016);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010502, 'A01-S05-V02', 'INTERCOMINICADORES', 3, 1010500, 2017);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010503, 'A01-S05-V03', 'SISTEMA DE RADIOCUMUNICACIÓN', 3, 1010500, 2018);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010504, 'A01-S05-V04', 'SISTEMA TELEFÓNICO', 3, 1010500, 2019);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010505, 'A01-S05-V05', 'SISTEMA DE TRANSMISIÓN DE VIDEO, VOZ Y DATA', 3, 1010500, 2020);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010601, 'A01-S06-V01', 'OPI', 3, 1010600, 2021);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010602, 'A01-S06-V02', 'GNB', 3, 1010600, 2022);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010603, 'A01-S06-V03', 'MILICIA', 3, 1010600, 2023);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010604, 'A01-S06-V04', 'FUERZA DE RESPUESTA EN INSTALACIÓN', 3, 1010600, 2024);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010605, 'A01-S06-V05', 'FUERZA DE RESPUESTA EXTERNA A LA INSTALACIÓN (FANB/GNB)', 3, 1010600, 2025);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010606, 'A01-S06-V06', 'EQUIPOS DE PROTECCIÓN (EPP, CONOS, CHALECOS, FORO PILOTO, ENTRE OTROS)', 3, 1010600, 2026);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010607, 'A01-S06-V07', 'EQUIPOS DE BUSQUEDA (RAYOS X, DETECTORES DE METALES, DROGA, EXPLOSIVOS, ACTIVOS)', 3, 1010600, 2027);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010608, 'A01-S06-V08', 'SUMINISTRO ÉLECTRICO ALTERNO PARA EL SISTEMA DE PROTECCIÓN', 3, 1010600, 2028);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010609, 'A01-S06-V09', 'VEHÍCULOS DE PATRULLAJE', 3, 1010600, 2029);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010701, 'A01-S07-V01', 'CONTROLES MANUALES', 3, 1010700, 2030);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010702, 'A01-S07-V02', 'CENTRO DE CONTROL', 3, 1010700, 2031);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010801, 'A01-S08-V01', 'POLÍTICAS DE CONTROL DE ACCESO', 3, 1010800, 2032);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010802, 'A01-S08-V02', 'PLAN DE PROTECCIÓN', 3, 1010800, 2033);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010803, 'A01-S08-V03', 'PLAN DE EMERGENCIA', 3, 1010800, 2034);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1010804, 'A01-S08-V04', 'SEÑALIZACIÓN DE ÁREAS RESTRINGIDAS DE P.C.P.', 3, 1010800, 2035);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020001, 'A02-V01', 'PLANES DE EMERGENCIAS', 3, 1020000, 2041);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020002, 'A02-V02', 'SEÑALIZACIÓN (ZONA DE SEGURIDAD)', 3, 1020000, 2042);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020003, 'A02-V03', 'SIMULACROS', 3, 1020000, 2043);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020004, 'A02-V04', 'EQUIPOS DE MEDICIÓN', 3, 1020000, 2044);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020005, 'A02-V05', 'MANGAS DE VIENTO', 3, 1020000, 2045);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020006, 'A02-V06', 'SISTEMAS CONTRA INCENDIO (AGUA)', 3, 1020000, 2046);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020007, 'A02-V07', 'SISTEMAS CONTRA INCENDIO (ESPUMA)', 3, 1020000, 2047);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020008, 'A02-V08', 'PERSONAL DE SEGURIDAD INDUSTRIAL', 3, 1020000, 2048);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020009, 'A02-V09', 'MANUAL, PROCEDIMIENTO Y NOTIFICACIÓN DE RIESGOS', 3, 1020000, 2049);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1020010, 'A02-V10', 'UNIDADES DE RESPUESTA INMEDIATAS', 3, 1020000, 2050);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030001, 'A03-V01', 'MANTENIMIENTO PREVENTIVO', 3, 1030000, 2051);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030002, 'A03-V02', 'DISPOSITIVOS Y DETECCIÓN DE FALLAS', 3, 1030000, 2052);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030003, 'A03-V03', 'REPUESTOS Y EQUIPOS', 3, 1030000, 2053);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030004, 'A03-V04', 'PERSONAL DE MANTENIMIENTO', 3, 1030000, 2054);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030005, 'A03-V05', 'PLANES DE MANTENIMIENTO', 3, 1030000, 2055);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030006, 'A03-V06', 'PERSONAL OPERACIONAL', 3, 1030000, 2056);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030007, 'A03-V07', 'MEDIOS DE TRANSPORTE', 3, 1030000, 2057);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030008, 'A03-V08', 'PLANES DE EMERGENCIA', 3, 1030000, 2058);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1030009, 'A03-V09', 'PLANES DE CONTINGENCIA OPERACIONAL', 3, 1030000, 2059);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040001, 'A04-V01', 'TANQUES DE ALMACENAMIENTO', 3, 1040000, 2061);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040002, 'A04-V02', 'SUBESTACIÓN ELÉCTRICA INTERNA', 3, 1040000, 2062);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040003, 'A04-V03', 'SUBESTACIÓN ELÉCTRICA EXTERNA', 3, 1040000, 2063);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040004, 'A04-V04', 'ESTACIÓN DE BOMBAS', 3, 1040000, 2064);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040005, 'A04-V05', 'TUBERIAS DE CRUDO DE 42’’', 3, 1040000, 2065);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040006, 'A04-V06', 'CENTRO DE CONTROL (CDC)', 3, 1040000, 2066);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040007, 'A04-V07', 'CENTRO DE CONTROL (MEREY OFICINA)', 3, 1040000, 2067);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040008, 'A04-V08', 'ESTACIONES REMOTAS (REBOMBEO, ANACO, Km. 52 ERO Y MORERO)', 3, 1040000, 2068);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040009, 'A04-V09', 'PALMICHAL', 3, 1040000, 2069);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1040010, 'A04-V10', 'SALA DE BOOSTER', 3, 1040000, 2070);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050001, 'A05-V01', 'FIBRA OPTICA', 3, 1050000, 2071);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050002, 'A05-V02', 'SOFTWARE', 3, 1050000, 2072);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050003, 'A05-V03', 'CONSUMIBLES (REPUESTOS: PLC, SWITCHES,TARJETAS, CENTRO OTROS)', 3, 1050000, 2073);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050004, 'A05-V04', 'HARDWARE (MONITORES, CPU)', 3, 1050000, 2074);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050005, 'A05-V05', 'RADIOS', 3, 1050000, 2075);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050006, 'A05-V06', 'SISTEMAS DE ALIMENTACIÓN ININTERUMPIDA (UPS)', 3, 1050000, 2076);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1050007, 'A05-V07', 'CUARTO DE SERVIDORES', 3, 1050000, 2077);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1060001, 'A06-V01', 'RELACIONES (ACERCAMIENTO) CON LAS COMUNIDADES', 3, 1060000, 2081);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1060002, 'A06-V02', 'BÚSQUEDA DE INFORMACIÓN (INTELIGENCIA SOCIAL)', 3, 1060000, 2082);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1060003, 'A06-V03', 'BÚSQUEDA DE FUENTES DE INFORMACIÓN', 3, 1060000, 2083);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1070001, 'A07-V01', 'PRESENCIA DE EFECTIVOS DE LA FANB', 3, 1070000, 2091);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1070002, 'A07-V02', 'EFECTIVIDAD DEL CUMPLIMIENTO DEL PLAN OPERATIVO VIGENTE (POV) EN EL PUESTO DE SERVICIO', 3, 1070000, 2092);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1070003, 'A07-V03', 'CONDICIONES DEL LUGAR DE DESCANSO DE LOS EFECTIVOS', 3, 1070000, 2093);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1070004, 'A07-V04', 'PAGO DE LAS PRIMAS ESTABLECIDAS EN EL CONVENIO GN/PDVSA', 3, 1070000, 2094);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable) values (1070005, 'A07-V05', 'APOYO POR PARTE DE LOS OSC', 3, 1070000, 2095);
