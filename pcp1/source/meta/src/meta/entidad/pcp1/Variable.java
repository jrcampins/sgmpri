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
 * Variable Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
public class Variable extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private Variable() {
        this(null, null);
    }

    public Variable(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    /**
     * business key property field
     */
    @BusinessKey
    public StringProperty codigo;

    /**
     * name property field
     */
    @NameProperty
    public StringProperty nombre;

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

    Check check01;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        rangoMinimo.setInitialValue(0);
        rangoMinimo.setDefaultValue(0);
        rangoMinimo.setMinValue(0);
        rangoMinimo.setMaxValue(1);
        rangoMaximo.setInitialValue(3);
        rangoMaximo.setDefaultValue(3);
        rangoMaximo.setMinValue(1);
        rangoMaximo.setMaxValue(9);
        setOrderBy(codigo);
    }

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        check01 = rangoMinimo.isLessThan(rangoMaximo);
        check01.setDefaultErrorMessage("el rango mínimo es mayor o igual que el rango máximo");
    }

}
