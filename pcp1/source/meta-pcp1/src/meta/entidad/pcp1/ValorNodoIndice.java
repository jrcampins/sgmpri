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
 * ValorNodoIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityUpdateOperation(enabled = Kleenean.FALSE)
@EntityDeleteOperation(enabled = Kleenean.FALSE)
public class ValorNodoIndice extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private ValorNodoIndice() {
        this(null, null);
    }

    public ValorNodoIndice(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("valor de nodo de índice");
        setDefaultShortLabel("valor de nodo");
        setDefaultCollectionLabel("Valores de Nodos de Indices");
        setDefaultCollectionShortLabel("Valores de Nodos");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public NodoIndice nodo;

    @ColumnField(nullable = Kleenean.FALSE)
    public DateProperty fechaValor;

    public IntegerProperty numeroRango;

    public StringProperty nombreRango;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 7, scale = 4)
    public BigDecimalProperty brechaNorma1;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 7, scale = 4)
    public BigDecimalProperty indiceNorma1;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.CHARACTER_KEY)
    public ColorIndice colorNorma1;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 7, scale = 4)
    public BigDecimalProperty brechaNorma2;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 7, scale = 4)
    public BigDecimalProperty indiceNorma2;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.CHARACTER_KEY)
    public ColorIndice colorNorma2;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        numeroRango.setDefaultLabel("número RTD");
        numeroRango.setDefaultDescription("numeral del Rango de Tendencia Dominante (RTD)");
        nombreRango.setDefaultLabel("nombre RTD");
        nombreRango.setDefaultDescription("forma lingüistica del Rango de Tendencia Dominante (RTD)");
        brechaNorma1.setDefaultLabel("brecha norma 1");
        brechaNorma1.setDefaultDescription("brecha calculada con la función Distancia Norma 1 (lineal)");
        brechaNorma2.setDefaultLabel("brecha norma 2");
        brechaNorma2.setDefaultDescription("brecha calculada con la función Distancia Norma 2 (no lineal)");
        indiceNorma1.setDefaultLabel("índice norma 1");
        indiceNorma1.setDefaultDescription("índice calculado con la función Distancia Norma 1 (lineal)");
        indiceNorma2.setDefaultLabel("índice norma 2");
        indiceNorma2.setDefaultDescription("índice calculado con la función Distancia Norma 2 (no lineal)");
        colorNorma1.setDefaultLabel("color norma 1");
        colorNorma1.setDefaultDescription("color del semáforo para el índice norma 1");
        colorNorma2.setDefaultLabel("color norma 2");
        colorNorma2.setDefaultDescription("color sel semáforo para el índice norma 2");
    }

}
