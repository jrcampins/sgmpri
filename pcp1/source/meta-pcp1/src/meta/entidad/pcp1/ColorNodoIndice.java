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
 * ColorNodoIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
public class ColorNodoIndice extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private ColorNodoIndice() {
        this(null, null);
    }

    public ColorNodoIndice(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("color de nodo de índice");
        setDefaultShortLabel("color de nodo");
        setDefaultCollectionLabel("Colores de Nodos de Indices");
        setDefaultCollectionShortLabel("Colores de Nodos");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    public NodoIndice nodo;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.CHARACTER_KEY)
    public ColorIndice color;

    @ColumnField(nullable = Kleenean.FALSE)
    public IntegerProperty extremoInferior;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        extremoInferior.setMinValue(0);
        extremoInferior.setMaxValue(100);
    }

    protected Key key01, key02;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(nodo, color);
        key02.setUnique(true);
        key02.newKeyField(nodo, extremoInferior);
        setOrderBy(key02);
    }

}
