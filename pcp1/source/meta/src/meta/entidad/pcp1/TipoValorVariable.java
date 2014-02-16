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
 * TipoValorVariable Persistent Entity.
 *
 * @author Jorge Campins
 */
public class TipoValorVariable extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private TipoValorVariable() {
        this(null, null);
    }

    public TipoValorVariable(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("tipo de valor de variable");
        setDefaultShortLabel("tipo de valor");
        setDefaultCollectionLabel("Tipos de Valor de Variables");
        setDefaultCollectionShortLabel("Tipos de Valor");
    }

    public Instance CONTINUO;

    public Instance DISCRETO;

}
