/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.util;

import adalid.commons.enums.LoggingLevel;
import adalid.commons.sql.SqlReader;
import meta.proyecto.comun.EntidadesComunes;

/**
 * @author Jorge Campins
 */
public class SQLReader {

    // <editor-fold defaultstate="collapsed" desc="listas de tablas">
    private static final String[] TABLAS_EXCLUIDAS = new String[]{
        "aplicacion",
        "clase_recurso",
        "clase_recurso_parametro",
        "clase_recurso_seccion",
        "condicion_ejecucion_funcion",
        "conjunto_segmento",
        "dominio",
        "dominio_paquete",
        "dominio_parametro",
        "dual",
        "elemento_segmento",
        "filtro_clase_recurso_funcion",
        "filtro_clase_recurso_parametro",
        "filtro_clase_recurso_seccion",
        "filtro_clase_recurso_vinculo",
        "filtro_funcion",
        "filtro_funcion_parametro",
        "funcion",
        "funcion_parametro",
        "grupo_aplicacion",
        "grupo_proceso",
        "mensaje",
        "nivel_opcion_menu",
        "opcion_binaria",
        "opcion_menu",
        "opcion_menu_plus",
        "opcion_sistema",
        "operador_comparacion",
        "pagina",
        "pagina_funcion",
        "pagina_usuario",
        "paquete",
        "parametro",
        "rastro_funcion",
        "rastro_funcion_parametro",
        "rastro_informe",
        "rastro_proceso",
        "recurso",
        "rol",
        "rol_aplicacion",
        "rol_filtro_funcion",
        "rol_funcion",
        "rol_pagina",
        "rol_usuario",
        "tipo_clase_recurso",
        "tipo_comparacion",
        "tipo_dato_parametro",
        "tipo_dominio",
        "tipo_funcion",
        "tipo_nodo",
        "tipo_pagina",
        "tipo_parametro",
        "tipo_parametro_dominio",
        "tipo_rastro_funcion",
        "tipo_recurso",
        "tipo_rol",
        "tipo_valor"
    };
    // </editor-fold>

    public static void main(String[] args) {
        SqlReader reader = new SqlReader(args);
        if (reader.isInitialised()) {
            EntidadesComunes.setAlertLoggingLevel(LoggingLevel.OFF);
            EntidadesComunes entidadesComunes = new EntidadesComunes();
            if (entidadesComunes.build()) {
                reader.setTablesExcludeSet(TABLAS_EXCLUIDAS);
                reader.setTablesInheritMap(entidadesComunes.getTablesMap());
                reader.generate();
            }
        }
    }

}
