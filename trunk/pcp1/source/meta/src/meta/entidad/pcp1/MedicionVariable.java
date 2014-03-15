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
 * MedicionVariable Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.OPERATION)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityDeleteOperation(enabled = Kleenean.FALSE)
public class MedicionVariable extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private MedicionVariable() {
        this(null, null);
    }

    public MedicionVariable(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("medición de variable");
        setDefaultShortLabel("medición de variable");
        setDefaultCollectionLabel("Mediciones de Variables");
        setDefaultCollectionShortLabel("Mediciones de Variables");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 2, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE_AND_DETAIL)
    @PropertyField(update = Kleenean.FALSE)
    public MedicionRama medicion;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(hidden = Kleenean.TRUE)
    public NodoIndice hoja;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 2, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
//  @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.NAME)
    @PropertyField(update = Kleenean.FALSE)
    public Variable variable;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 2, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.NAME)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public RangoVariable rango;

    public StringProperty comentarios;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        medicion.setDefaultLabel("medición por rama");
        medicion.setDefaultShortLabel("medición");
        setOrderBy(medicion.codigo, variable.codigo);
        linkForeignSegmentProperty(medicion.rama);
    }

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(medicion, variable);
    }

    protected Segment modificable;

    protected Check check01;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        /**/
        modificable = or(medicion.condicion.isEqualTo(medicion.condicion.PROGRAMADA), medicion.condicion.isEqualTo(medicion.condicion.RECHAZADA));
        modificable.setDefaultErrorMessage("la medición no se puede modificar porque no está Programada ni Rechazada");
        /**/
        check01 = rango.isNull().or(rango.variable.isEqualTo(variable));
        check01.setDefaultErrorMessage("el rango no corresponde a la variable");
    }

    @Override
    protected void settleFilters() {
        super.settleFilters();
        setUpdateFilter(modificable);
        rango.setSearchQueryFilter(rango.variable.isEqualTo(variable));
    }

}
