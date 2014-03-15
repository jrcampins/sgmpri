/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.entidad.pcp1;

import adalid.core.*;
import adalid.core.annotations.*;
import adalid.core.enums.*;
import adalid.core.interfaces.*;
import adalid.core.properties.*;
import java.lang.reflect.Field;

/**
 * RangoVariable Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
public class RangoVariable extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private RangoVariable() {
        this(null, null);
    }

    public RangoVariable(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("rango de variable");
        setDefaultShortLabel("rango");
        setDefaultCollectionLabel("Rangos de Variables");
        setDefaultCollectionShortLabel("Rangos");
        setDefaultLabel(variable, "rango por variable");
        setDefaultShortLabel(variable, "rango");
        setDefaultCollectionLabel(variable, "Rangos por Variable");
        setDefaultCollectionShortLabel(variable, "Rangos");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    @PropertyField(required = Kleenean.TRUE)
    public Variable variable;

    /**
     * integer property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(required = Kleenean.TRUE)
    public IntegerProperty numeral;

    /**
     * name property field
     */
    @NameProperty
    public StringProperty expresion;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        numeral.setDefaultLabel("numeral");
        numeral.setDefaultTooltip("numeral del rango");
        numeral.setMinValue(0);
        numeral.setMaxValue(9);
        expresion.setDefaultLabel("expresión");
        expresion.setDefaultTooltip("expresión lingüistica del rango");
        setOrderBy(variable.codigo, numeral);
    }

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(variable, numeral);
    }

    protected Check check01;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        check01 = numeral.isGreaterOrEqualTo(variable.rangoMinimo).and(numeral.isLessOrEqualTo(variable.rangoMaximo));
        check01.setDefaultErrorMessage("el numeral debe ser un número entero comprendido entre el rango mínimo y el rango máximo de la variable");
    }

}
