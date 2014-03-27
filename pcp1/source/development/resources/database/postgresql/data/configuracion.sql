truncate table valor_nodo_indice cascade;
truncate table medicion_variable cascade;
truncate table medicion_rama cascade;
truncate table medicion_nodo cascade;
truncate table nodo_indice cascade;
truncate table color_indice cascade;
truncate table variable cascade;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- variable
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1001, 'A01-S01-V01', 'CERCA TIPO MALLA CICLÓN CON PUERTAS Y/O PORTONES', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1002, 'A01-S01-V02', 'CERCA TIPO REJA CON PUERTAS Y/O PORTONES', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1003, 'A01-S01-V03', 'CONO PROTECTOR ANTIESCALAMIENTO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1004, 'A01-S01-V04', 'PAREDES DE BLOQUE O PREFABRICADO CON PUERTAS Y/O PORTONES', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1005, 'A01-S01-V05', 'MURO DE CONCRETO ARMADO CON PUERTAS Y/O PORTONES', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1006, 'A01-S02-V01', 'SISTEMAS DE DETECCIÓN INTERNO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1007, 'A01-S02-V02', 'SISTEMAS DE DETECCIÓN PERIMETRAL', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1008, 'A01-S03-V01', 'PUNTOS DE EVALUACIÓN SIMPLE', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1009, 'A01-S03-V02', 'GARITA / TORRE', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1010, 'A01-S03-V03', 'RECORRIDO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1011, 'A01-S03-V04', 'ILUMINACIÓN DE PROTECCIÓN', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1012, 'A01-S03-V05', 'SISTEMA DE VIDEO VIGILANCIA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1013, 'A01-S03-V06', 'SOFTWARE DE EVALUACIÓN Y ANÁLISIS DE SISTEMAS AUTOMATIZADOS', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1014, 'A01-S04-V01', 'ESTACIÓN DE MONITOREO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1015, 'A01-S04-V02', 'CENTRO DE CONTROL', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1016, 'A01-S05-V01', 'SISTEMA DE VOCEO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1017, 'A01-S05-V02', 'INTERCOMINICADORES', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1018, 'A01-S05-V03', 'SISTEMA DE RADIOCUMUNICACIÓN', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1019, 'A01-S05-V04', 'SISTEMA TELEFÓNICO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1020, 'A01-S05-V05', 'SISTEMA DE TRANSMISIÓN DE VIDEO, VOZ Y DATA', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1021, 'A01-S06-V01', 'O.P.I.', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1022, 'A01-S06-V02', 'G.N.B.', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1023, 'A01-S06-V03', 'MILICIA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1024, 'A01-S06-V04', 'FUERZA DE RESPUESTA EN INSTALACIÓN', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1025, 'A01-S06-V05', 'FUERZA DE RESPUESTA EXTERNA A LA INSTALACIÓN (F.A.N.B./G.N.B.)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1026, 'A01-S06-V06', 'EQUIPOS DE PROTECCIÓN (E.P.P., CONOS, CHALECOS, FORO PILOTO, ENTRE OTROS)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1027, 'A01-S06-V07', 'EQUIPOS DE BUSQUEDA (RAYOS X, DETECTORES DE METALES, DROGA, EXPLOSIVOS, ACTIVOS)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1028, 'A01-S06-V08', 'SUMINISTRO ÉLECTRICO ALTERNO PARA EL SISTEMA DE PROTECCIÓN', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1029, 'A01-S06-V09', 'VEHÍCULOS DE PATRULLAJE', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1030, 'A01-S07-V01', 'CONTROLES MANUALES', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1031, 'A01-S07-V02', 'CENTRO DE CONTROL', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1032, 'A01-S08-V01', 'POLÍTICAS DE CONTROL DE ACCESO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1033, 'A01-S08-V02', 'PLAN DE PROTECCIÓN', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1034, 'A01-S08-V03', 'PLAN DE EMERGENCIA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1035, 'A01-S08-V04', 'SEÑALIZACIÓN DE ÁREAS RESTRINGIDAS DE P.C.P.', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1041, 'A02-V01', 'PLANES DE EMERGENCIAS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1042, 'A02-V02', 'SEÑALIZACIÓN (ZONA DE SEGURIDAD)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1043, 'A02-V03', 'SIMULACROS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1044, 'A02-V04', 'EQUIPOS DE MEDICIÓN', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1045, 'A02-V05', 'MANGAS DE VIENTO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1046, 'A02-V06', 'SISTEMAS CONTRA INCENDIO (AGUA)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1047, 'A02-V07', 'SISTEMAS CONTRA INCENDIO (ESPUMA)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1048, 'A02-V08', 'PERSONAL DE SEGURIDAD INDUSTRIAL', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1049, 'A02-V09', 'MANUAL, PROCEDIMIENTO Y NOTIFICACIÓN DE RIESGOS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1050, 'A02-V10', 'UNIDADES DE RESPUESTA INMEDIATAS', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1051, 'A03-V01', 'MANTENIMIENTO PREVENTIVO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1052, 'A03-V02', 'DISPOSITIVOS Y DETECCIÓN DE FALLAS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1053, 'A03-V03', 'REPUESTOS Y EQUIPOS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1054, 'A03-V04', 'PERSONAL DE MANTENIMIENTO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1055, 'A03-V05', 'PLANES DE MANTENIMIENTO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1056, 'A03-V06', 'PERSONAL OPERACIONAL', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1057, 'A03-V07', 'MEDIOS DE TRANSPORTE', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1058, 'A03-V08', 'PLANES DE EMERGENCIA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1059, 'A03-V09', 'PLANES DE CONTINGENCIA OPERACIONAL', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1061, 'A04-V01', 'TANQUES DE ALMACENAMIENTO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1062, 'A04-V02', 'SUBESTACIÓN ELÉCTRICA INTERNA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1063, 'A04-V03', 'SUBESTACIÓN ELÉCTRICA EXTERNA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1064, 'A04-V04', 'ESTACIÓN DE BOMBAS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1065, 'A04-V05', 'TUBERIAS DE CRUDO DE 42’’', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1066, 'A04-V06', 'CENTRO DE CONTROL (C.D.C.)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1067, 'A04-V07', 'CENTRO DE CONTROL (MEREY OFICINA)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1068, 'A04-V08', 'ESTACIONES REMOTAS (REBOMBEO, ANACO, Km. 52 ERO Y MORERO)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1069, 'A04-V09', 'PALMICHAL', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1070, 'A04-V10', 'SALA DE BOOSTER', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1071, 'A05-V01', 'FIBRA OPTICA', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1072, 'A05-V02', 'SOFTWARE', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1073, 'A05-V03', 'CONSUMIBLES (REPUESTOS: P.L.C., SWITCHES,TARJETAS, CENTRO OTROS)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1074, 'A05-V04', 'HARDWARE (MONITORES, C.P.U.)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1075, 'A05-V05', 'RADIOS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1076, 'A05-V06', 'SISTEMAS DE ALIMENTACIÓN ININTERUMPIDA (U.P.S.)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1077, 'A05-V07', 'CUARTO DE SERVIDORES', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1081, 'A06-V01', 'RELACIONES (ACERCAMIENTO) CON LAS COMUNIDADES', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1082, 'A06-V02', 'BÚSQUEDA DE INFORMACIÓN (INTELIGENCIA SOCIAL)', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1083, 'A06-V03', 'BÚSQUEDA DE FUENTES DE INFORMACIÓN', 0, 3);

insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1091, 'A07-V01', 'PRESENCIA DE EFECTIVOS DE LA F.A.N.B.', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1092, 'A07-V02', 'EFECTIVIDAD DEL CUMPLIMIENTO DEL PLAN OPERATIVO VIGENTE (P.O.V.) EN EL PUESTO DE SERVICIO', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1093, 'A07-V03', 'CONDICIONES DEL LUGAR DE DESCANSO DE LOS EFECTIVOS', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1094, 'A07-V04', 'PAGO DE LAS PRIMAS ESTABLECIDAS EN EL CONVENIO G.N.B./P.D.V.S.A.', 0, 3);
insert into variable (id, codigo, nombre, rango_minimo, rango_maximo)
values (1095, 'A07-V05', 'APOYO POR PARTE DE LOS O.S.C.', 0, 3);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- rango_variable
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
update rango_variable set expresion=numeral||'. '||'AUSENTE'
from variable v
where rango_variable.numeral=0 and v.id=rango_variable.variable;
update rango_variable set expresion=numeral||'. '||'OBSOLETO'
from variable v
where rango_variable.numeral=1 and v.id=rango_variable.variable;
update rango_variable set expresion=numeral||'. '||'INEFICAZ'
from variable v
where rango_variable.numeral=2 and v.id=rango_variable.variable;
update rango_variable set expresion=numeral||'. '||'CUMPLE'
from variable v
where rango_variable.numeral=3 and v.id=rango_variable.variable;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- color_indice
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
insert into color_indice (id, codigo, extremo_inferior) values (1001, 'ROJO',      0);
insert into color_indice (id, codigo, extremo_inferior) values (1002, 'AMARILLO', 50);
insert into color_indice (id, codigo, extremo_inferior) values (1003, 'VERDE',    80);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- nodo_indice
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
insert into nodo_indice (id, codigo, nombre, tipo_nodo)
values (1000000, 'A00', 'P.T.O. - SAN TOMÉ', 1);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010000, 'A01', 'PROTECCIÓN FÍSICA', 2, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1020000, 'A02', 'SEGURIDAD INDUSTRIAL', 2, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1030000, 'A03', 'CONTINUIDAD OPERACIONAL', 2, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1040000, 'A04', 'INFRAESTRUCTURA OPERACIONAL', 2, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1050000, 'A05', 'INFRAESTRUCTURA TECNOLÓGICA', 2, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1060000, 'A06', 'ENTORNO SOCIAL', 2, 1000000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1070000, 'A07', 'OPERATIVIDAD CON LA F.A.N.B./O.S.C. Y OTROS ENTES DEL ESTADO', 2, 1000000);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010100, 'A01-S01', 'BARRERAS Y RETARDOS', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010200, 'A01-S02', 'DETECCIÓN', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010300, 'A01-S03', 'EVALUACIÓN', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010400, 'A01-S04', 'CONTROL Y MONITOREO', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010500, 'A01-S05', 'COMUNICACIONES', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010600, 'A01-S06', 'PERSONAL Y EQUIPO', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010700, 'A01-S07', 'CONTROL Y ACCESO', 2, 1010000);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior)
values (1010800, 'A01-S08', 'NORMAS Y PROCEDIMIENTOS', 2, 1010000);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010101, 'A01-S01-V01', 'CERCA TIPO MALLA CICLÓN CON PUERTAS Y/O PORTONES', 3, 1010100, 1001);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010102, 'A01-S01-V02', 'CERCA TIPO REJA CON PUERTAS Y/O PORTONES', 3, 1010100, 1002);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010103, 'A01-S01-V03', 'CONO PROTECTOR ANTIESCALAMIENTO', 3, 1010100, 1003);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010104, 'A01-S01-V04', 'PAREDES DE BLOQUE O PREFABRICADO CON PUERTAS Y/O PORTONES', 3, 1010100, 1004);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010105, 'A01-S01-V05', 'MURO DE CONCRETO ARMADO CON PUERTAS Y/O PORTONES', 3, 1010100, 1005);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010201, 'A01-S02-V01', 'SISTEMAS DE DETECCIÓN INTERNO', 3, 1010200, 1006);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010202, 'A01-S02-V02', 'SISTEMAS DE DETECCIÓN PERIMETRAL', 3, 1010200, 1007);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010301, 'A01-S03-V01', 'PUNTOS DE EVALUACIÓN SIMPLE', 3, 1010300, 1008);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010302, 'A01-S03-V02', 'GARITA / TORRE', 3, 1010300, 1009);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010303, 'A01-S03-V03', 'RECORRIDO', 3, 1010300, 1010);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010304, 'A01-S03-V04', 'ILUMINACIÓN DE PROTECCIÓN', 3, 1010300, 1011);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010305, 'A01-S03-V05', 'SISTEMA DE VIDEO VIGILANCIA', 3, 1010300, 1012);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010306, 'A01-S03-V06', 'SOFTWARE DE EVALUACIÓN Y ANÁLISIS DE SISTEMAS AUTOMATIZADOS', 3, 1010300, 1013);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010401, 'A01-S04-V01', 'ESTACIÓN DE MONITOREO', 3, 1010400, 1014);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010402, 'A01-S04-V02', 'CENTRO DE CONTROL', 3, 1010400, 1015);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010501, 'A01-S05-V01', 'SISTEMA DE VOCEO', 3, 1010500, 1016);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010502, 'A01-S05-V02', 'INTERCOMINICADORES', 3, 1010500, 1017);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010503, 'A01-S05-V03', 'SISTEMA DE RADIOCUMUNICACIÓN', 3, 1010500, 1018);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010504, 'A01-S05-V04', 'SISTEMA TELEFÓNICO', 3, 1010500, 1019);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010505, 'A01-S05-V05', 'SISTEMA DE TRANSMISIÓN DE VIDEO, VOZ Y DATA', 3, 1010500, 1020);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010601, 'A01-S06-V01', 'O.P.I.', 3, 1010600, 1021);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010602, 'A01-S06-V02', 'G.N.B.', 3, 1010600, 1022);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010603, 'A01-S06-V03', 'MILICIA', 3, 1010600, 1023);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010604, 'A01-S06-V04', 'FUERZA DE RESPUESTA EN INSTALACIÓN', 3, 1010600, 1024);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010605, 'A01-S06-V05', 'FUERZA DE RESPUESTA EXTERNA A LA INSTALACIÓN (F.A.N.B./G.N.B.)', 3, 1010600, 1025);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010606, 'A01-S06-V06', 'EQUIPOS DE PROTECCIÓN (E.P.P., CONOS, CHALECOS, FORO PILOTO, ENTRE OTROS)', 3, 1010600, 1026);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010607, 'A01-S06-V07', 'EQUIPOS DE BUSQUEDA (RAYOS X, DETECTORES DE METALES, DROGA, EXPLOSIVOS, ACTIVOS)', 3, 1010600, 1027);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010608, 'A01-S06-V08', 'SUMINISTRO ÉLECTRICO ALTERNO PARA EL SISTEMA DE PROTECCIÓN', 3, 1010600, 1028);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010609, 'A01-S06-V09', 'VEHÍCULOS DE PATRULLAJE', 3, 1010600, 1029);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010701, 'A01-S07-V01', 'CONTROLES MANUALES', 3, 1010700, 1030);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010702, 'A01-S07-V02', 'CENTRO DE CONTROL', 3, 1010700, 1031);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010801, 'A01-S08-V01', 'POLÍTICAS DE CONTROL DE ACCESO', 3, 1010800, 1032);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010802, 'A01-S08-V02', 'PLAN DE PROTECCIÓN', 3, 1010800, 1033);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010803, 'A01-S08-V03', 'PLAN DE EMERGENCIA', 3, 1010800, 1034);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1010804, 'A01-S08-V04', 'SEÑALIZACIÓN DE ÁREAS RESTRINGIDAS DE P.C.P.', 3, 1010800, 1035);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020001, 'A02-V01', 'PLANES DE EMERGENCIAS', 3, 1020000, 1041);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020002, 'A02-V02', 'SEÑALIZACIÓN (ZONA DE SEGURIDAD)', 3, 1020000, 1042);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020003, 'A02-V03', 'SIMULACROS', 3, 1020000, 1043);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020004, 'A02-V04', 'EQUIPOS DE MEDICIÓN', 3, 1020000, 1044);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020005, 'A02-V05', 'MANGAS DE VIENTO', 3, 1020000, 1045);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020006, 'A02-V06', 'SISTEMAS CONTRA INCENDIO (AGUA)', 3, 1020000, 1046);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020007, 'A02-V07', 'SISTEMAS CONTRA INCENDIO (ESPUMA)', 3, 1020000, 1047);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020008, 'A02-V08', 'PERSONAL DE SEGURIDAD INDUSTRIAL', 3, 1020000, 1048);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020009, 'A02-V09', 'MANUAL, PROCEDIMIENTO Y NOTIFICACIÓN DE RIESGOS', 3, 1020000, 1049);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1020010, 'A02-V10', 'UNIDADES DE RESPUESTA INMEDIATAS', 3, 1020000, 1050);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030001, 'A03-V01', 'MANTENIMIENTO PREVENTIVO', 3, 1030000, 1051);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030002, 'A03-V02', 'DISPOSITIVOS Y DETECCIÓN DE FALLAS', 3, 1030000, 1052);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030003, 'A03-V03', 'REPUESTOS Y EQUIPOS', 3, 1030000, 1053);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030004, 'A03-V04', 'PERSONAL DE MANTENIMIENTO', 3, 1030000, 1054);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030005, 'A03-V05', 'PLANES DE MANTENIMIENTO', 3, 1030000, 1055);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030006, 'A03-V06', 'PERSONAL OPERACIONAL', 3, 1030000, 1056);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030007, 'A03-V07', 'MEDIOS DE TRANSPORTE', 3, 1030000, 1057);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030008, 'A03-V08', 'PLANES DE EMERGENCIA', 3, 1030000, 1058);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1030009, 'A03-V09', 'PLANES DE CONTINGENCIA OPERACIONAL', 3, 1030000, 1059);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040001, 'A04-V01', 'TANQUES DE ALMACENAMIENTO', 3, 1040000, 1061);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040002, 'A04-V02', 'SUBESTACIÓN ELÉCTRICA INTERNA', 3, 1040000, 1062);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040003, 'A04-V03', 'SUBESTACIÓN ELÉCTRICA EXTERNA', 3, 1040000, 1063);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040004, 'A04-V04', 'ESTACIÓN DE BOMBAS', 3, 1040000, 1064);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040005, 'A04-V05', 'TUBERIAS DE CRUDO DE 42’’', 3, 1040000, 1065);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040006, 'A04-V06', 'CENTRO DE CONTROL (C.D.C.)', 3, 1040000, 1066);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040007, 'A04-V07', 'CENTRO DE CONTROL (MEREY OFICINA)', 3, 1040000, 1067);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040008, 'A04-V08', 'ESTACIONES REMOTAS (REBOMBEO, ANACO, Km. 52 ERO Y MORERO)', 3, 1040000, 1068);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040009, 'A04-V09', 'PALMICHAL', 3, 1040000, 1069);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1040010, 'A04-V10', 'SALA DE BOOSTER', 3, 1040000, 1070);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050001, 'A05-V01', 'FIBRA OPTICA', 3, 1050000, 1071);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050002, 'A05-V02', 'SOFTWARE', 3, 1050000, 1072);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050003, 'A05-V03', 'CONSUMIBLES (REPUESTOS: P.L.C., SWITCHES,TARJETAS, CENTRO OTROS)', 3, 1050000, 1073);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050004, 'A05-V04', 'HARDWARE (MONITORES, C.P.U.)', 3, 1050000, 1074);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050005, 'A05-V05', 'RADIOS', 3, 1050000, 1075);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050006, 'A05-V06', 'SISTEMAS DE ALIMENTACIÓN ININTERUMPIDA (U.P.S.)', 3, 1050000, 1076);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1050007, 'A05-V07', 'CUARTO DE SERVIDORES', 3, 1050000, 1077);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1060001, 'A06-V01', 'RELACIONES (ACERCAMIENTO) CON LAS COMUNIDADES', 3, 1060000, 1081);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1060002, 'A06-V02', 'BÚSQUEDA DE INFORMACIÓN (INTELIGENCIA SOCIAL)', 3, 1060000, 1082);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1060003, 'A06-V03', 'BÚSQUEDA DE FUENTES DE INFORMACIÓN', 3, 1060000, 1083);

insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1070001, 'A07-V01', 'PRESENCIA DE EFECTIVOS DE LA F.A.N.B.', 3, 1070000, 1091);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1070002, 'A07-V02', 'EFECTIVIDAD DEL CUMPLIMIENTO DEL PLAN OPERATIVO VIGENTE (P.O.V.) EN EL PUESTO DE SERVICIO', 3, 1070000, 1092);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1070003, 'A07-V03', 'CONDICIONES DEL LUGAR DE DESCANSO DE LOS EFECTIVOS', 3, 1070000, 1093);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1070004, 'A07-V04', 'PAGO DE LAS PRIMAS ESTABLECIDAS EN EL CONVENIO G.N.B./P.D.V.S.A.', 3, 1070000, 1094);
insert into nodo_indice (id, codigo, nombre, tipo_nodo, superior, variable)
values (1070005, 'A07-V05', 'APOYO POR PARTE DE LOS O.S.C.', 3, 1070000, 1095);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- initcap
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
update variable set nombre=initcap(nombre);
update variable set nombre=replace(nombre, ' A ',      ' a '     );
update variable set nombre=replace(nombre, ' E ',      ' e '     );
update variable set nombre=replace(nombre, ' Y ',      ' y '     );
update variable set nombre=replace(nombre, ' O ',      ' o '     );
update variable set nombre=replace(nombre, ' U ',      ' u '     );
update variable set nombre=replace(nombre, ' Con ',    ' con '   );
update variable set nombre=replace(nombre, ' De ',     ' de '    );
update variable set nombre=replace(nombre, ' Del ',    ' del '   );
update variable set nombre=replace(nombre, ' En ',     ' en '    );
update variable set nombre=replace(nombre, ' Entre ',  ' entre ' );
update variable set nombre=replace(nombre, ' El ',     ' el '    );
update variable set nombre=replace(nombre, ' La ',     ' la '    );
update variable set nombre=replace(nombre, ' Los ',    ' los '   );
update variable set nombre=replace(nombre, ' Las ',    ' las '   );
update variable set nombre=replace(nombre, ' Otro ',   ' otro '  );
update variable set nombre=replace(nombre, ' Otra ',   ' otra '  );
update variable set nombre=replace(nombre, ' Otros ',  ' otros ' );
update variable set nombre=replace(nombre, ' Otras ',  ' otras ' );
update variable set nombre=replace(nombre, ' Para ',   ' para '  );
update variable set nombre=replace(nombre, ' Y/O ',    ' y/o '   );
update rango_variable set expresion=initcap(expresion);
update color_indice set codigo=initcap(codigo);
update nodo_indice set nombre=initcap(nombre);
update nodo_indice set nombre=replace(nombre, ' A ',      ' a '     );
update nodo_indice set nombre=replace(nombre, ' E ',      ' e '     );
update nodo_indice set nombre=replace(nombre, ' Y ',      ' y '     );
update nodo_indice set nombre=replace(nombre, ' O ',      ' o '     );
update nodo_indice set nombre=replace(nombre, ' U ',      ' u '     );
update nodo_indice set nombre=replace(nombre, ' Con ',    ' con '   );
update nodo_indice set nombre=replace(nombre, ' De ',     ' de '    );
update nodo_indice set nombre=replace(nombre, ' Del ',    ' del '   );
update nodo_indice set nombre=replace(nombre, ' En ',     ' en '    );
update nodo_indice set nombre=replace(nombre, ' Entre ',  ' entre ' );
update nodo_indice set nombre=replace(nombre, ' El ',     ' el '    );
update nodo_indice set nombre=replace(nombre, ' La ',     ' la '    );
update nodo_indice set nombre=replace(nombre, ' Los ',    ' los '   );
update nodo_indice set nombre=replace(nombre, ' Las ',    ' las '   );
update nodo_indice set nombre=replace(nombre, ' Otro ',   ' otro '  );
update nodo_indice set nombre=replace(nombre, ' Otra ',   ' otra '  );
update nodo_indice set nombre=replace(nombre, ' Otros ',  ' otros ' );
update nodo_indice set nombre=replace(nombre, ' Otras ',  ' otras ' );
update nodo_indice set nombre=replace(nombre, ' Para ',   ' para '  );
update nodo_indice set nombre=replace(nombre, ' Y/O ',    ' y/o '   );

select nodo_indice$update$peso_ahp(id) from nodo_indice where tipo_nodo<>3;
select nodo_indice$update$peso_simplificado(id) from nodo_indice where tipo_nodo<>3;
