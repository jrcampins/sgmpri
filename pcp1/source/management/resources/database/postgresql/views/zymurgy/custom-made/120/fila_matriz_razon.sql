/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
/*
 * author: Jorge Campins
 */
drop view if exists consulta_fila_matriz_razon cascade;
/*
create view consulta_fila_matriz_razon as
select
    fila_matriz_razon.id,
    fila_matriz_razon.version,
    fila_matriz_razon.codigo,
    fila_matriz_razon.nodo,
    fila_matriz_razon.fila,
    fila_matriz_razon.dimension,
    fila_matriz_razon.c01,
    fila_matriz_razon.c02,
    fila_matriz_razon.c03,
    fila_matriz_razon.c04,
    fila_matriz_razon.c05,
    fila_matriz_razon.c06,
    fila_matriz_razon.c07,
    fila_matriz_razon.c08,
    fila_matriz_razon.c09,
    fila_matriz_razon.c10,
    fila_matriz_razon.c11,
    fila_matriz_razon.c12,
    fila_matriz_razon.c13,
    fila_matriz_razon.c14,
    fila_matriz_razon.c15,
    fila_matriz_razon.c16,
    fila_matriz_razon.c17,
    fila_matriz_razon.c18,
    fila_matriz_razon.c19,
    fila_matriz_razon.c20,
    fila_matriz_razon.claves,
    fila_matriz_razon.etiquetas,
        nodo_indice_1.id as id_1,
        nodo_indice_1.version as version_1,
        nodo_indice_1.codigo as codigo_1,
        nodo_indice_1.nombre as nombre_1,
        nodo_indice_1.peso_asignado as peso_asignado_1,
        nodo_indice_1.peso_a_h_p as peso_a_h_p_1,
        nodo_indice_1.peso_simplificado as peso_simplificado_1,
        ordinal_razon_2.numero as numero_2,
        ordinal_razon_2.codigo as codigo_2,
        ordinal_razon_2.razon as razon_2,
        ordinal_razon_3.numero as numero_3,
        ordinal_razon_3.codigo as codigo_3,
        ordinal_razon_3.razon as razon_3,
        ordinal_razon_4.numero as numero_4,
        ordinal_razon_4.codigo as codigo_4,
        ordinal_razon_4.razon as razon_4,
        ordinal_razon_5.numero as numero_5,
        ordinal_razon_5.codigo as codigo_5,
        ordinal_razon_5.razon as razon_5,
        ordinal_razon_6.numero as numero_6,
        ordinal_razon_6.codigo as codigo_6,
        ordinal_razon_6.razon as razon_6,
        ordinal_razon_7.numero as numero_7,
        ordinal_razon_7.codigo as codigo_7,
        ordinal_razon_7.razon as razon_7,
        ordinal_razon_8.numero as numero_8,
        ordinal_razon_8.codigo as codigo_8,
        ordinal_razon_8.razon as razon_8,
        ordinal_razon_9.numero as numero_9,
        ordinal_razon_9.codigo as codigo_9,
        ordinal_razon_9.razon as razon_9,
        ordinal_razon_10.numero as numero_10,
        ordinal_razon_10.codigo as codigo_10,
        ordinal_razon_10.razon as razon_10,
        ordinal_razon_11.numero as numero_11,
        ordinal_razon_11.codigo as codigo_11,
        ordinal_razon_11.razon as razon_11,
        ordinal_razon_12.numero as numero_12,
        ordinal_razon_12.codigo as codigo_12,
        ordinal_razon_12.razon as razon_12,
        ordinal_razon_13.numero as numero_13,
        ordinal_razon_13.codigo as codigo_13,
        ordinal_razon_13.razon as razon_13,
        ordinal_razon_14.numero as numero_14,
        ordinal_razon_14.codigo as codigo_14,
        ordinal_razon_14.razon as razon_14,
        ordinal_razon_15.numero as numero_15,
        ordinal_razon_15.codigo as codigo_15,
        ordinal_razon_15.razon as razon_15,
        ordinal_razon_16.numero as numero_16,
        ordinal_razon_16.codigo as codigo_16,
        ordinal_razon_16.razon as razon_16,
        ordinal_razon_17.numero as numero_17,
        ordinal_razon_17.codigo as codigo_17,
        ordinal_razon_17.razon as razon_17,
        ordinal_razon_18.numero as numero_18,
        ordinal_razon_18.codigo as codigo_18,
        ordinal_razon_18.razon as razon_18,
        ordinal_razon_19.numero as numero_19,
        ordinal_razon_19.codigo as codigo_19,
        ordinal_razon_19.razon as razon_19,
        ordinal_razon_20.numero as numero_20,
        ordinal_razon_20.codigo as codigo_20,
        ordinal_razon_20.razon as razon_20,
        ordinal_razon_21.numero as numero_21,
        ordinal_razon_21.codigo as codigo_21,
        ordinal_razon_21.razon as razon_21
    from seudo_fila_matriz_razon as fila_matriz_razon
    inner join nodo_indice as nodo_indice_1 on nodo_indice_1.id = fila_matriz_razon.nodo
    inner join ordinal_razon as ordinal_razon_2 on ordinal_razon_2.numero = fila_matriz_razon.c01
    inner join ordinal_razon as ordinal_razon_3 on ordinal_razon_3.numero = fila_matriz_razon.c02
    inner join ordinal_razon as ordinal_razon_4 on ordinal_razon_4.numero = fila_matriz_razon.c03
    inner join ordinal_razon as ordinal_razon_5 on ordinal_razon_5.numero = fila_matriz_razon.c04
    inner join ordinal_razon as ordinal_razon_6 on ordinal_razon_6.numero = fila_matriz_razon.c05
    inner join ordinal_razon as ordinal_razon_7 on ordinal_razon_7.numero = fila_matriz_razon.c06
    inner join ordinal_razon as ordinal_razon_8 on ordinal_razon_8.numero = fila_matriz_razon.c07
    inner join ordinal_razon as ordinal_razon_9 on ordinal_razon_9.numero = fila_matriz_razon.c08
    inner join ordinal_razon as ordinal_razon_10 on ordinal_razon_10.numero = fila_matriz_razon.c09
    inner join ordinal_razon as ordinal_razon_11 on ordinal_razon_11.numero = fila_matriz_razon.c10
    inner join ordinal_razon as ordinal_razon_12 on ordinal_razon_12.numero = fila_matriz_razon.c11
    inner join ordinal_razon as ordinal_razon_13 on ordinal_razon_13.numero = fila_matriz_razon.c12
    inner join ordinal_razon as ordinal_razon_14 on ordinal_razon_14.numero = fila_matriz_razon.c13
    inner join ordinal_razon as ordinal_razon_15 on ordinal_razon_15.numero = fila_matriz_razon.c14
    inner join ordinal_razon as ordinal_razon_16 on ordinal_razon_16.numero = fila_matriz_razon.c15
    inner join ordinal_razon as ordinal_razon_17 on ordinal_razon_17.numero = fila_matriz_razon.c16
    inner join ordinal_razon as ordinal_razon_18 on ordinal_razon_18.numero = fila_matriz_razon.c17
    inner join ordinal_razon as ordinal_razon_19 on ordinal_razon_19.numero = fila_matriz_razon.c18
    inner join ordinal_razon as ordinal_razon_20 on ordinal_razon_20.numero = fila_matriz_razon.c19
    inner join ordinal_razon as ordinal_razon_21 on ordinal_razon_21.numero = fila_matriz_razon.c20
;
*/
create view consulta_fila_matriz_razon as select * from seudo_fila_matriz_razon;
