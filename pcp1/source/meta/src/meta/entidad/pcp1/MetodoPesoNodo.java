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
 * MetodoPesoNodo Persistent Entity.
 *
 * @author Jorge Campins
 */
public class MetodoPesoNodo extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private MetodoPesoNodo() {
        this(null, null);
    }

    public MetodoPesoNodo(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("método de asignación de peso");
        setDefaultShortLabel("método");
        setDefaultCollectionLabel("Métodos de Asignación de Pesos");
        setDefaultCollectionShortLabel("Métodos");
    }

    public Instance ASIGNACION_DIRECTA;

    public Instance METODO_AHP;

    public Instance METODO_SIMPLIFICADO;

}
