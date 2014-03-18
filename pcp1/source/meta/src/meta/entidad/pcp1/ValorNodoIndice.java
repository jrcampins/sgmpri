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
import meta.entidad.comun.configuracion.basica.TipoNodo;

/**
 * ValorNodoIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityDeleteOperation(enabled = Kleenean.FALSE)
@EntityTableView(updates = Kleenean.FALSE)
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
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    @PropertyField(update = Kleenean.FALSE)
    public MedicionNodo medicion;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public NodoIndice nodo;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.FALSE, report = Kleenean.FALSE, search = Kleenean.TRUE, update = Kleenean.FALSE)
    public TipoNodo tipoNodo;

    /**
     * parent entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(hidden = Kleenean.TRUE)
    public ValorNodoIndice superior;

    @BigDecimalField(precision = 16, scale = 10)
    @PropertyField(table = Kleenean.FALSE, report = Kleenean.FALSE, update = Kleenean.FALSE)
    public BigDecimalProperty peso;

    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(table = Kleenean.FALSE, report = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaValor;

    @StringField(maxLength = 20)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public StringProperty rango;

    @PropertyField(update = Kleenean.FALSE)
    public IntegerProperty numeralRango;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 5, scale = 2)
    @PropertyField(update = Kleenean.FALSE)
    public BigDecimalProperty brechaNorma1;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 5, scale = 2)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public BigDecimalProperty indiceNorma1;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.CHARACTER_KEY)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public ColorIndice colorNorma1;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 5, scale = 2)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public BigDecimalProperty indiceNorma2;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @EntityReferenceSearch(searchType = SearchType.LIST, listStyle = ListStyle.CHARACTER_KEY)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public ColorIndice colorNorma2;

    public StringProperty comentarios;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        medicion.setDefaultLabel("medición");
        medicion.setDefaultDescription("medición por nodo");
//      medicion.codigo.setDefaultLabel("medición");
//      medicion.nombre.setDefaultLabel("nombre de la medición");
        nodo.setDefaultLabel("nodo");
        nodo.setDefaultDescription("nodo de índice");
//      nodo.codigo.setDefaultLabel("nodo");
//      nodo.nombre.setDefaultLabel("nombre del nodo");
        rango.setDefaultLabel("rango");
        rango.setDefaultDescription("expresión lingüistica del rango");
        numeralRango.setDefaultLabel("numeral");
        numeralRango.setDefaultDescription("numeral del rango");
        brechaNorma1.setDefaultLabel("brecha 1");
        brechaNorma1.setDefaultDescription("brecha calculada con la función Distancia Norma 1 (lineal)");
        indiceNorma1.setDefaultLabel("índice 1");
        indiceNorma1.setDefaultDescription("índice calculado con la función Distancia Norma 1 (lineal)");
        indiceNorma2.setDefaultLabel("índice 2");
        indiceNorma2.setDefaultDescription("índice calculado con la función Distancia Norma 2 (no lineal)");
        colorNorma1.setDefaultLabel("color 1");
        colorNorma1.setDefaultDescription("color del semáforo para el índice 1");
//      colorNorma1.codigo.setDefaultLabel("color 1");
        colorNorma2.setDefaultLabel("color 2");
        colorNorma2.setDefaultDescription("color sel semáforo para el índice 2");
//      colorNorma2.codigo.setDefaultLabel("color 2");
        setOrderBy(medicion.codigo, nodo.codigo);
    }

}
