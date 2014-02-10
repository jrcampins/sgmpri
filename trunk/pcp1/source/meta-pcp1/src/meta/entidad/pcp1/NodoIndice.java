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
import adalid.core.expressions.*;
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
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.TRUE, required = Kleenean.TRUE)
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
     * boolean property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.TRUE)
    public BooleanProperty coagulador;

    /**
     * big decimal property field
     */
    @PropertyField(create = Kleenean.TRUE)
    public IntegerProperty amarillo;

    /**
     * big decimal property field
     */
    @PropertyField(create = Kleenean.TRUE)
    public IntegerProperty verde;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE)
    public PeriodoCalculo periodo;

    /**
     * date property field
     */
    @PropertyField(create = Kleenean.TRUE)
    public DateProperty fechaProximoCalculo;

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
        peso.setInitialValue(1);
        peso.setDefaultValue(1);
        coagulador.setInitialValue(false);
        coagulador.setDefaultValue(false);
        /**/
        NumericConditionalX nx1 = tipoNodo.isNotEqualTo(tipoNodo.HOJA).then(50);
        NumericConditionalX nx2 = tipoNodo.isNotEqualTo(tipoNodo.HOJA).then(80);
        /**/
        amarillo.setDefaultDescription("extremo inferior del intervalo Amarillo");
        amarillo.setInitialValue(nx1);
        amarillo.setDefaultValue(nx1);
        amarillo.setMinValue(0);
        amarillo.setMaxValue(100);
        /**/
        verde.setDefaultDescription("extremo inferior del intervalo Verde");
        verde.setInitialValue(nx2);
        verde.setDefaultValue(nx2);
        verde.setMinValue(0);
        verde.setMaxValue(100);
    }

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(codigo);
        setOrderBy(key01);
    }

    protected Tab tab1, tab2, tab3, tab4;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(tipoNodo, numero, clave, peso, coagulador, amarillo, verde);
        tab2.setDefaultLabel("general");
        tab2.newTabField(tipoNodo, numero, clave, peso, superior, coagulador, amarillo, verde);
        tab3.setDefaultLabel("general");
        tab3.newTabField(tipoNodo, numero, clave, peso, superior, fuente, variable);
        tab4.setDefaultLabel("cálculo");
        tab4.newTabField(periodo, fechaProximoCalculo, fechaUltimoCalculo);
    }

    protected Check check01, check02, check03, check04, check05, check06, check07, check08, check09, check10, check11, check12, check13;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        check01 = tipoNodo.isEqualTo(tipoNodo.RAIZ).xnor(superior.isNull());
        check01.setDefaultErrorMessage("el nodo superior se debe especificar si y solo si el tipo de nodo no es Raiz");
        check02 = this.isNull().or(superior.isNullOrNotEqualTo(this));
        check02.setDefaultErrorMessage("el nodo superior no puede ser este mismo nodo");
        check13 = superior.isNotNull().implies(superior.tipoNodo.isNotEqualTo(tipoNodo.HOJA));
        check13.setDefaultErrorMessage("el nodo superior no puede un nodo de tipo Hoja");
        check03 = tipoNodo.isEqualTo(tipoNodo.HOJA).xnor(fuente.isNotNull());
        check03.setDefaultErrorMessage("la fuente se debe especificar si y solo si el tipo de nodo es Hoja");
        check04 = tipoNodo.isEqualTo(tipoNodo.HOJA).xnor(variable.isNotNull());
        check04.setDefaultErrorMessage("la variable se debe especificar si y solo si el tipo de nodo es Hoja");
        check05 = tipoNodo.isEqualTo(tipoNodo.HOJA).implies(coagulador.isFalse());
        check05.setDefaultErrorMessage("el nodo puede ser coagulador solo si el tipo de nodo es Hoja");
        check06 = tipoNodo.isEqualTo(tipoNodo.HOJA).xnor(amarillo.isNull());
        check06.setDefaultErrorMessage("el extremo inferior del intervalo Amarillo se debe especificar si y solo si el tipo de nodo no es Hoja");
        check07 = tipoNodo.isEqualTo(tipoNodo.HOJA).xnor(verde.isNull());
        check07.setDefaultErrorMessage("el extremo inferior del intervalo Verde se debe especificar si y solo si el tipo de nodo no es Hoja");
        check08 = amarillo.isNullOrLessThan(verde);
        check08.setDefaultErrorMessage("el extremo inferior del intervalo Amarillo debe ser menor que del intervalo Verde");
        check09 = tipoNodo.isEqualTo(tipoNodo.HOJA).implies(periodo.isNull());
        check09.setDefaultErrorMessage("el periodo de cálculo se debe especificar solo si el tipo de nodo es Hoja");
        check10 = tipoNodo.isEqualTo(tipoNodo.HOJA).implies(fechaProximoCalculo.isNull());
        check10.setDefaultErrorMessage("la fecha del próximo cálculo se debe especificar solo si el tipo de nodo es Hoja");
        check11 = tipoNodo.isEqualTo(tipoNodo.HOJA).or(periodo.isNull().xnor(fechaProximoCalculo.isNull()));
        check11.setDefaultErrorMessage("el periodo de cálculo y la fecha del próximo cálculo se deben especificar conjuntamente");
        check12 = fechaUltimoCalculo.isNullOrLessThan(fechaProximoCalculo);
        check12.setDefaultErrorMessage("la fecha de la próxima medición debe ser mayor que la de la última medición");
    }

    @Override
    protected void settleFilters() {
        super.settleFilters();
        tab1.setRenderingFilter(tipoNodo.isEqualTo(tipoNodo.RAIZ));
        tab2.setRenderingFilter(tipoNodo.isEqualTo(tipoNodo.RAMA));
        tab3.setRenderingFilter(tipoNodo.isEqualTo(tipoNodo.HOJA));
        tab4.setRenderingFilter(tipoNodo.isNotEqualTo(tipoNodo.HOJA));
        /**/
        superior.setRequiringFilter(tipoNodo.isNotEqualTo(tipoNodo.RAIZ));
        fuente.setRequiringFilter(tipoNodo.isEqualTo(tipoNodo.HOJA));
        variable.setRequiringFilter(tipoNodo.isEqualTo(tipoNodo.HOJA));
        amarillo.setRequiringFilter(tipoNodo.isNotEqualTo(tipoNodo.HOJA));
        verde.setRequiringFilter(tipoNodo.isNotEqualTo(tipoNodo.HOJA));
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
