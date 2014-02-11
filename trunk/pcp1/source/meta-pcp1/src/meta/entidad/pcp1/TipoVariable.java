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
 * TipoVariable Persistent Entity.
 *
 * @author Jorge Campins
 */
public class TipoVariable extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private TipoVariable() {
        this(null, null);
    }

    public TipoVariable(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("tipo de variable");
        setDefaultShortLabel("tipo de variable");
        setDefaultCollectionLabel("Tipos de Variables");
        setDefaultCollectionShortLabel("Tipos de Variables");
    }

    static final String TIPO_TANGIBLE = "1";

    static final String TIPO_INTANGIBLE = "2";

    public Instance TANGIBLE;

    public Instance INTANGIBLE;

}
