/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pcp1ap101.lib.data.provider.xdp3;

import javax.sql.rowset.CachedRowSet;
import pcp1ap101.lib.core.util.ClassX;
import pcp1ap101.lib.core.util.TypeValuePair;
import pcp1ap101.lib.data.provider.xdp2.FilaMatrizRazonCachedRowSetDataProvider2;

/**
 * @author Jorge Campins
 */
public class FilaMatrizRazonCachedRowSetDataProvider3 extends FilaMatrizRazonCachedRowSetDataProvider2 {

    public static FilaMatrizRazonCachedRowSetDataProvider3 newInstance() {
        Class<?> clase = FilaMatrizRazonCachedRowSetDataProvider3.class;
        String subclase = ClassX.get().subclassName(clase, "data_provider");
        Object instance = ClassX.get().newInstance(clase, subclase);
        return (FilaMatrizRazonCachedRowSetDataProvider3) instance;
    }

    public static FilaMatrizRazonCachedRowSetDataProvider3 newInstance(CachedRowSet cachedRowSet) {
        Class<?> clase = FilaMatrizRazonCachedRowSetDataProvider3.class;
        TypeValuePair parametro = new TypeValuePair(CachedRowSet.class, cachedRowSet);
        String subclase = ClassX.get().subclassName(clase, "data_provider");
        Object instance = ClassX.get().newInstance(clase, subclase, parametro);
        return (FilaMatrizRazonCachedRowSetDataProvider3) instance;
    }

    public FilaMatrizRazonCachedRowSetDataProvider3() {
        super();
    }

    public FilaMatrizRazonCachedRowSetDataProvider3(CachedRowSet cachedRowSet) {
        super(cachedRowSet);
    }

    @Override
    public String getComandoSelect() {
        return ""
            + "select * from razon_nodo_indice$crosstab" + "(" + getIdentificacionMaestro() + ") "
            + "as fila_matriz_razon (id bigint, version bigint, codigo character varying, nodo bigint, dimension integer, "
            + "c01 integer, c02 integer, c03 integer, c04 integer, c05 integer, c06 integer, c07 integer, c08 integer, c09 integer, c10 integer, "
            + "c11 integer, c12 integer, c13 integer, c14 integer, c15 integer, c16 integer, c17 integer, c18 integer, c19 integer, c20 integer) "
            + "";
    }

}
