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
@EntitySelectOperation(rowsLimit = 1500)
@EntityTableView(inserts = Kleenean.FALSE)
@EntityTreeView(enabled = Kleenean.TRUE)
@EntityTriggers(afterCheck = Kleenean.TRUE)
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
        setDefaultShortLabel("nodo");
        setDefaultCollectionLabel("Nodos de Indices");
        setDefaultCollectionShortLabel("Nodos");
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
    @PropertyField(create = Kleenean.TRUE, table = Kleenean.TRUE, report = Kleenean.TRUE, required = Kleenean.TRUE, submit = Kleenean.TRUE)
    public TipoNodo tipoNodo;

    /**
     * parent entity reference property field
     */
    @ParentProperty
    @Allocation(maxDepth = 2, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public NodoIndice superior;

    @PropertyField(hidden = Kleenean.TRUE)
    public IntegerProperty numero;

    @PropertyField(hidden = Kleenean.TRUE)
    public StringProperty clave;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 16, scale = 15)
    @ColumnField(nullable = Kleenean.TRUE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.FALSE, report = Kleenean.FALSE)
    public BigDecimalProperty peso;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE)
    public Fuente fuente;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE)
    public Variable variable;

    /**
     * date property field
     */
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaUltimoCalculo;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        tipoNodo.setInitialValue(tipoNodo.RAIZ);
        tipoNodo.setDefaultValue(tipoNodo.RAIZ);
        numero.setMinValue(1);
        numero.setMaxValue(100);
        setOrderBy(codigo);
    }

    protected Tab tab1, tab2, tab3, tab4;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(tipoNodo, numero, clave, peso, fechaUltimoCalculo);
        tab2.setDefaultLabel("general");
        tab2.newTabField(tipoNodo, numero, clave, peso, superior, fechaUltimoCalculo);
        tab3.setDefaultLabel("general");
        tab3.newTabField(tipoNodo, numero, clave, peso, superior, fuente, variable, fechaUltimoCalculo);
    }

    protected Segment raiz, rama, hoja;

    protected Check check01, check02, check03, check04, check05;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        raiz = tipoNodo.isEqualTo(tipoNodo.RAIZ);
        rama = tipoNodo.isEqualTo(tipoNodo.RAMA);
        hoja = tipoNodo.isEqualTo(tipoNodo.HOJA);
        /**/
        check01 = raiz.xnor(superior.isNull());
        check01.setDefaultErrorMessage("el nodo superior se debe especificar si y solo si el tipo de nodo no es Raiz");
        check02 = this.isNull().or(superior.isNullOrNotEqualTo(this));
        check02.setDefaultErrorMessage("el nodo superior no puede ser este mismo nodo");
        check03 = superior.isNotNull().implies(superior.tipoNodo.isNotEqualTo(tipoNodo.HOJA));
        check03.setDefaultErrorMessage("el nodo superior no puede ser un nodo de tipo Hoja");
        check04 = hoja.xnor(fuente.isNotNull());
        check04.setDefaultErrorMessage("la fuente se debe especificar si y solo si el tipo de nodo es Hoja");
        check05 = hoja.xnor(variable.isNotNull());
        check05.setDefaultErrorMessage("la variable se debe especificar si y solo si el tipo de nodo es Hoja");
    }

    @Override
    protected void settleFilters() {
        super.settleFilters();
        tab1.setRenderingFilter(raiz);
        tab2.setRenderingFilter(rama);
        tab3.setRenderingFilter(hoja);
        tab4.setRenderingFilter(not(hoja));
        /**/
//      superior.setRenderingFilter(not(raiz));
        superior.setRequiringFilter(not(raiz));
        superior.setModifyingFilter(not(raiz));
        superior.setNullifyingFilter(raiz);
        /**/
//      fuente.setRenderingFilter(hoja);
        fuente.setRequiringFilter(hoja);
        fuente.setModifyingFilter(hoja);
        fuente.setNullifyingFilter(not(hoja));
        /**/
//      variable.setRenderingFilter(hoja);
        variable.setRequiringFilter(hoja);
        variable.setModifyingFilter(hoja);
        variable.setNullifyingFilter(not(hoja));
    }

    protected Programar programar;

    @ProcessOperationClass(overloading = Kleenean.FALSE)
    @OperationClass(access = OperationAccess.RESTRICTED)
    public class Programar extends ProcessOperation {

        @Override
        protected void settleAttributes() {
            super.settleAttributes();
            setDefaultLabel("programar mediciones");
        }

        /**
         * instance reference parameter field
         */
        @InstanceReference
        protected NodoIndice nodo;

    }

    protected Calcular calcular;

    @ProcessOperationClass(overloading = Kleenean.FALSE)
    @OperationClass(access = OperationAccess.RESTRICTED)
    public class Calcular extends ProcessOperation {

        /**
         * instance reference parameter field
         */
        @InstanceReference
        protected NodoIndice nodo;

    }

}
