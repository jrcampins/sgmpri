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
 * ImpactoNodo Persistent Entity.
 *
 * @author Jorge Campins
 */
public class ImpactoNodo extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private ImpactoNodo() {
        this(null, null);
    }

    public ImpactoNodo(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("impacto en el logro del objetivo");
        setDefaultShortLabel("impacto");
        setDefaultCollectionLabel("Impactos en el logro del objetivo");
        setDefaultCollectionShortLabel("Impactos");
    }

    public Instance MODERADO;

    public Instance ALTO;

    public Instance MUY_ALTO;

    @Override
    protected void settleInstances() {
        super.settleInstances();
        MODERADO.newInstanceField(numero, 1);
        MODERADO.newInstanceField(codigo, 1 + ". Moderado");
        ALTO.newInstanceField(numero, 3);
        ALTO.newInstanceField(codigo, 3 + ". Alto");
        MUY_ALTO.newInstanceField(numero, 5);
        MUY_ALTO.newInstanceField(codigo, 5 + ". Muy Alto");
    }

}
