/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.entidad.pcp1;

import adalid.core.*;
import adalid.core.interfaces.*;
import java.lang.reflect.Field;

/**
 * TipoPesoNodo Persistent Entity.
 *
 * @author Jorge Campins
 */
public class TipoPesoNodo extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private TipoPesoNodo() {
        this(null, null);
    }

    public TipoPesoNodo(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("tipo de peso de nodo");
        setDefaultShortLabel("tipo de peso");
        setDefaultCollectionLabel("Tipos de Pesos de Nodos");
        setDefaultCollectionShortLabel("Tipos de Pesos");
    }

    public Instance INDETERMINADO;

    public Instance ASIGNACION_DIRECTA;

    public Instance METODO_AHP;

    public Instance METODO_SIMPLIFICADO;

    @Override
    protected void settleInstances() {
        super.settleInstances();
        ASIGNACION_DIRECTA.newInstanceField(codigo, "Asignación Directa");
        METODO_AHP.newInstanceField(codigo, "Método AHP");
        METODO_SIMPLIFICADO.newInstanceField(codigo, "Método Simplificado");
    }

}
