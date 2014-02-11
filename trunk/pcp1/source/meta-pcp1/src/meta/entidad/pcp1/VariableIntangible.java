/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.entidad.pcp1;

import adalid.core.annotations.*;
import adalid.core.enums.*;
import adalid.core.interfaces.*;
import adalid.core.properties.*;
import java.lang.reflect.Field;

/**
 * VariableIntangible Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
@DiscriminatorValue(TipoVariable.TIPO_INTANGIBLE)
public class VariableIntangible extends Variable {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private VariableIntangible() {
        this(null, null);
    }

    public VariableIntangible(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("variable intangible");
        setDefaultShortLabel("variable intangible");
        setDefaultCollectionLabel("Variables Intangibles");
        setDefaultCollectionShortLabel("Variables Intangibles");
    }

    /**
     * integer property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(required = Kleenean.TRUE)
    public IntegerProperty rangoMinimo;

    /**
     * integer property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(required = Kleenean.TRUE)
    public IntegerProperty rangoMaximo;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        rangoMinimo.setInitialValue(0);
        rangoMinimo.setDefaultValue(0);
        rangoMinimo.setMinValue(0);
        rangoMinimo.setMaxValue(1);
        rangoMaximo.setInitialValue(4);
        rangoMaximo.setDefaultValue(4);
        rangoMaximo.setMinValue(1);
        rangoMaximo.setMaxValue(9);
    }

}
