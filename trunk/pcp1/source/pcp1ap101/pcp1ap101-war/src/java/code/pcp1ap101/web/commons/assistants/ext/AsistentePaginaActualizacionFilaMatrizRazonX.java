/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package pcp1ap101.web.commons.assistants.ext;

import com.sun.data.provider.RowKey;
import java.util.ArrayList;
import org.apache.commons.lang.StringUtils;
import pcp1ap101.lib.base.entity.enumeration.OrdinalRazonEnumeration;
import pcp1ap101.lib.base.util.IntUtils;
import pcp1ap101.lib.core.jsf.JSF;
import pcp1ap101.web.commons.assistants.AsistentePaginaActualizacionFilaMatrizRazon;
import pcp1ap101.web.commons.interfaces.PaginaActualizacionFilaMatrizRazon;
import pcp1ap101.web.registro.pages.FilaMatrizRazon21PorNodo;

/**
 * @author Jorge Campins
 */
public class AsistentePaginaActualizacionFilaMatrizRazonX extends AsistentePaginaActualizacionFilaMatrizRazon {

    public AsistentePaginaActualizacionFilaMatrizRazonX(PaginaActualizacionFilaMatrizRazon pagina) {
        super(pagina);
    }

    @Override
    public void prepresentar() {
        super.prepresentar();
        RowKey rowKey = bean.getGestor().getCurrentRowKey();
        boolean rowAvailable = bean.getFilaMatrizRazonDataProvider().isRowAvailable(rowKey);
        if (rowAvailable && bean instanceof FilaMatrizRazon21PorNodo) {
            FilaMatrizRazon21PorNodo pagina = (FilaMatrizRazon21PorNodo) bean;
            String etiquetas = bean.getFilaMatrizRazonDataProvider().getEtiquetas(rowKey);
            String[] strings = StringUtils.split(etiquetas, '\n');
            pagina.getTableColumnC011().setHeaderText(string(strings, 1));
            pagina.getTableColumnC021().setHeaderText(string(strings, 2));
            pagina.getTableColumnC031().setHeaderText(string(strings, 3));
            pagina.getTableColumnC041().setHeaderText(string(strings, 4));
            pagina.getTableColumnC051().setHeaderText(string(strings, 5));
            pagina.getTableColumnC061().setHeaderText(string(strings, 6));
            pagina.getTableColumnC071().setHeaderText(string(strings, 7));
            pagina.getTableColumnC081().setHeaderText(string(strings, 8));
            pagina.getTableColumnC091().setHeaderText(string(strings, 9));
            pagina.getTableColumnC101().setHeaderText(string(strings, 10));
            pagina.getTableColumnC111().setHeaderText(string(strings, 11));
            pagina.getTableColumnC121().setHeaderText(string(strings, 12));
            pagina.getTableColumnC131().setHeaderText(string(strings, 13));
            pagina.getTableColumnC141().setHeaderText(string(strings, 14));
            pagina.getTableColumnC151().setHeaderText(string(strings, 15));
            pagina.getTableColumnC161().setHeaderText(string(strings, 16));
            pagina.getTableColumnC171().setHeaderText(string(strings, 17));
            pagina.getTableColumnC181().setHeaderText(string(strings, 18));
            pagina.getTableColumnC191().setHeaderText(string(strings, 19));
            pagina.getTableColumnC201().setHeaderText(string(strings, 20));
        }
    }

    private String string(String[] strings, int i) {
        return i < 1 || i > strings.length ? null : strings[i - 1];
    }

    // <editor-fold defaultstate="collapsed" desc="metodos getOptions">
    @Override
    public Object getOptionsCampoC011() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC021() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC031() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC041() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC051() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC061() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC071() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC081() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC091() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC101() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC111() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC121() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC131() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC141() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC151() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC161() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC171() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC181() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC191() {
        return getOrdinalRazonOptions();
    }

    @Override
    public Object getOptionsCampoC201() {
        return getOrdinalRazonOptions();
    }
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="metodos isColumnRendered">
    @Override
    public boolean isColumnC01Rendered() {
        return isColumnOrdinalRazonRendered(1);
    }

    @Override
    public boolean isColumnC02Rendered() {
        return isColumnOrdinalRazonRendered(2);
    }

    @Override
    public boolean isColumnC03Rendered() {
        return isColumnOrdinalRazonRendered(3);
    }

    @Override
    public boolean isColumnC04Rendered() {
        return isColumnOrdinalRazonRendered(4);
    }

    @Override
    public boolean isColumnC05Rendered() {
        return isColumnOrdinalRazonRendered(5);
    }

    @Override
    public boolean isColumnC06Rendered() {
        return isColumnOrdinalRazonRendered(6);
    }

    @Override
    public boolean isColumnC07Rendered() {
        return isColumnOrdinalRazonRendered(7);
    }

    @Override
    public boolean isColumnC08Rendered() {
        return isColumnOrdinalRazonRendered(8);
    }

    @Override
    public boolean isColumnC09Rendered() {
        return isColumnOrdinalRazonRendered(9);
    }

    @Override
    public boolean isColumnC10Rendered() {
        return isColumnOrdinalRazonRendered(10);
    }

    @Override
    public boolean isColumnC11Rendered() {
        return isColumnOrdinalRazonRendered(11);
    }

    @Override
    public boolean isColumnC12Rendered() {
        return isColumnOrdinalRazonRendered(12);
    }

    @Override
    public boolean isColumnC13Rendered() {
        return isColumnOrdinalRazonRendered(13);
    }

    @Override
    public boolean isColumnC14Rendered() {
        return isColumnOrdinalRazonRendered(14);
    }

    @Override
    public boolean isColumnC15Rendered() {
        return isColumnOrdinalRazonRendered(15);
    }

    @Override
    public boolean isColumnC16Rendered() {
        return isColumnOrdinalRazonRendered(16);
    }

    @Override
    public boolean isColumnC17Rendered() {
        return isColumnOrdinalRazonRendered(17);
    }

    @Override
    public boolean isColumnC18Rendered() {
        return isColumnOrdinalRazonRendered(18);
    }

    @Override
    public boolean isColumnC19Rendered() {
        return isColumnOrdinalRazonRendered(19);
    }

    @Override
    public boolean isColumnC20Rendered() {
        return isColumnOrdinalRazonRendered(20);
    }
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="metodos isFieldModifyingFiltered">
    @Override
    protected boolean isFieldC01ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(1);
    }

    @Override
    protected boolean isFieldC02ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(2);
    }

    @Override
    protected boolean isFieldC03ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(3);
    }

    @Override
    protected boolean isFieldC04ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(4);
    }

    @Override
    protected boolean isFieldC05ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(5);
    }

    @Override
    protected boolean isFieldC06ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(6);
    }

    @Override
    protected boolean isFieldC07ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(7);
    }

    @Override
    protected boolean isFieldC08ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(8);
    }

    @Override
    protected boolean isFieldC09ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(9);
    }

    @Override
    protected boolean isFieldC10ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(10);
    }

    @Override
    protected boolean isFieldC11ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(11);
    }

    @Override
    protected boolean isFieldC12ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(12);
    }

    @Override
    protected boolean isFieldC13ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(13);
    }

    @Override
    protected boolean isFieldC14ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(14);
    }

    @Override
    protected boolean isFieldC15ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(15);
    }

    @Override
    protected boolean isFieldC16ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(16);
    }

    @Override
    protected boolean isFieldC17ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(17);
    }

    @Override
    protected boolean isFieldC18ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(18);
    }

    @Override
    protected boolean isFieldC19ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(19);
    }

    @Override
    protected boolean isFieldC20ModifyingFiltered() {
        return isFieldOrdinalRazonModifyingFiltered(20);
    }
    // </editor-fold>

    private ArrayList ordinalRazonOptions;

    protected Object getOrdinalRazonOptions() {
        if (ordinalRazonOptions == null) {
            OrdinalRazonEnumeration[] values = OrdinalRazonEnumeration.values();
            ordinalRazonOptions = JSF.getListaOpciones(values, false, false);
        }
        return ordinalRazonOptions;
    }

    protected boolean isColumnOrdinalRazonRendered(int i) {
        RowKey rowKey = bean.getGestor().getCurrentRowKey();
        boolean rowAvailable = bean.getFilaMatrizRazonDataProvider().isRowAvailable(rowKey);
        return (rowAvailable && IntUtils.valueOf(bean.getFilaMatrizRazonDataProvider().getDimension(rowKey)) >= i);
    }

    protected boolean isFieldOrdinalRazonModifyingFiltered(int i) {
        RowKey rowKey = bean.getGestor().getCurrentRowKey();
        boolean rowAvailable = bean.getFilaMatrizRazonDataProvider().isRowAvailable(rowKey);
        return (rowAvailable && IntUtils.valueOf(bean.getFilaMatrizRazonDataProvider().getFila(rowKey)) < i);
    }

}
