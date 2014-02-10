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
import meta.entidad.comun.configuracion.basica.TipoNodo;

/**
 * NodoIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
@EntitySelectOperation(rowsLimit = 5000)
@EntityTreeView(enabled = Kleenean.TRUE)
public class NodoIndice extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private NodoIndice() {
        this(null, null);
    }

    public NodoIndice(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("nodo de índice");
        setDefaultShortLabel("nodo de índice");
        setDefaultCollectionLabel("Nodos de Indices");
        setDefaultCollectionShortLabel("Nodos de Indices");
    }

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
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public TipoNodo tipoNodo;

    /**
     * parent entity reference property field
     */
    @ParentProperty
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public NodoIndice superior;

    public IntegerProperty numero;

    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public StringProperty clave;

    /**
     * boolean property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    public BooleanProperty coagulador;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 16, scale = 15)
    @ColumnField(nullable = Kleenean.FALSE)
    public BigDecimalProperty peso;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE_AND_DETAIL)
    public Fuente fuente;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public Variable variable;

    /**
     * big decimal property field
     */
    public IntegerProperty amarillo;

    /**
     * big decimal property field
     */
    public IntegerProperty verde;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        tipoNodo.setInitialValue(tipoNodo.RAIZ);
        tipoNodo.setDefaultValue(tipoNodo.RAIZ);
        numero.setMinValue(1);
        numero.setMaxValue(100);
        coagulador.setInitialValue(false);
        coagulador.setDefaultValue(false);
        peso.setInitialValue(1);
        peso.setDefaultValue(1);
        amarillo.setDefaultDescription("extremo inferior del intervalo Amarillo");
//      amarillo.setInitialValue(50);
//      amarillo.setDefaultValue(50);
        amarillo.setMinValue(0);
        amarillo.setMaxValue(100);
        verde.setDefaultDescription("extremo inferior del intervalo Verde");
//      verde.setInitialValue(80);
//      verde.setDefaultValue(80);
        verde.setMinValue(0);
        verde.setMaxValue(100);
    }

    protected Tab tab1, tab2;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(coagulador, peso, fuente, variable, amarillo, verde);
        tab2.setDefaultLabel("jerarquía");
        tab2.newTabField(tipoNodo, superior, numero, clave);
    }

}
