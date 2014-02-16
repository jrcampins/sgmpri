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
@AbstractClass
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
@InheritanceMapping(strategy = InheritanceMappingStrategy.SINGLE_TABLE)
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
     * many-to-one entity reference property field
     */
    @DiscriminatorColumn
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE)
    public TipoVariable tipoVariable;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        setOrderBy(codigo);
    }

}
