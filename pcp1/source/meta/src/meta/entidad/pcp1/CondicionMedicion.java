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
 * CondicionMedicion Persistent Entity.
 *
 * @author Jorge Campins
 */
public class CondicionMedicion extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private CondicionMedicion() {
        this(null, null);
    }

    public CondicionMedicion(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("condición de medición");
        setDefaultShortLabel("condición");
        setDefaultCollectionLabel("Condiciones de Mediciones");
        setDefaultCollectionShortLabel("Condiciones");
    }

    public Instance PROGRAMADA;

    public Instance REGISTRADA;

    public Instance ACEPTADA;

    public Instance RECHAZADA;

}
