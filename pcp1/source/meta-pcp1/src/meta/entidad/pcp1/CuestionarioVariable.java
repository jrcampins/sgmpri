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
import java.lang.reflect.Field;

/**
 * CuestionarioVariable Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
public class CuestionarioVariable extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private CuestionarioVariable() {
        this(null, null);
    }

    public CuestionarioVariable(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("asociación cuestionario/variable");
        setDefaultShortLabel("cuestionario/variable");
        setDefaultCollectionLabel("Asociaciones Cuestionario/Variable");
        setDefaultCollectionShortLabel("Cuestionarios/Variables");
        setDefaultLabel(cuestionario, "variable por cuestionario");
        setDefaultShortLabel(cuestionario, "variable");
        setDefaultCollectionLabel(cuestionario, "Variables por Cuestionario");
        setDefaultCollectionShortLabel(cuestionario, "Variables");
        setDefaultLabel(variable, "cuestionario por variable");
        setDefaultShortLabel(variable, "cuestionario");
        setDefaultCollectionLabel(variable, "Cuestionarios por Variable");
        setDefaultCollectionShortLabel(variable, "Cuestionarios");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    @PropertyField(required = Kleenean.TRUE)
    public Cuestionario cuestionario;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE)
    public Variable variable;

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(cuestionario, variable);
    }

}
