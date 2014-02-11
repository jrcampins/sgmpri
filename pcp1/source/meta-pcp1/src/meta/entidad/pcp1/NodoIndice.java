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

    protected Segment raiz, rama, hoja;

    protected Check check01, check02, check03, check04, check05, check06, check07, check08, check09, check10, check11, check12, check13;

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
        check03.setDefaultErrorMessage("el nodo superior no puede un nodo de tipo Hoja");
        check04 = hoja.xnor(fuente.isNotNull());
        check04.setDefaultErrorMessage("la fuente se debe especificar si y solo si el tipo de nodo es Hoja");
        check05 = hoja.xnor(variable.isNotNull());
        check05.setDefaultErrorMessage("la variable se debe especificar si y solo si el tipo de nodo es Hoja");
        check06 = hoja.implies(coagulador.isFalse());
        check06.setDefaultErrorMessage("el nodo puede ser coagulador solo si el tipo de nodo es Hoja");
        check07 = hoja.xnor(amarillo.isNull());
        check07.setDefaultErrorMessage("el extremo inferior del intervalo Amarillo se debe especificar si y solo si el tipo de nodo no es Hoja");
        check08 = hoja.xnor(verde.isNull());
        check08.setDefaultErrorMessage("el extremo inferior del intervalo Verde se debe especificar si y solo si el tipo de nodo no es Hoja");
        check09 = amarillo.isNullOrLessThan(verde);
        check09.setDefaultErrorMessage("el extremo inferior del intervalo Amarillo debe ser menor que del intervalo Verde");
        check10 = hoja.implies(periodo.isNull());
        check10.setDefaultErrorMessage("el periodo de cálculo se debe especificar solo si el tipo de nodo es Hoja");
        check11 = hoja.implies(fechaProximoCalculo.isNull());
        check11.setDefaultErrorMessage("la fecha del próximo cálculo se debe especificar solo si el tipo de nodo es Hoja");
        check12 = hoja.or(periodo.isNull().xnor(fechaProximoCalculo.isNull()));
        check12.setDefaultErrorMessage("el periodo de cálculo y la fecha del próximo cálculo se deben especificar conjuntamente");
        check13 = fechaUltimoCalculo.isNullOrLessThan(fechaProximoCalculo);
        check13.setDefaultErrorMessage("la fecha de la próxima medición debe ser mayor que la de la última medición");
    }

    @Override
    protected void settleFilters() {
        super.settleFilters();
        tab1.setRenderingFilter(raiz);
        tab2.setRenderingFilter(rama);
        tab3.setRenderingFilter(hoja);
        tab4.setRenderingFilter(not(hoja));
        /**/
        superior.setRequiringFilter(not(raiz));
//      superior.setModifyingFilter(not(raiz));
        /**/
        fuente.setRequiringFilter(hoja);
//      fuente.setModifyingFilter(hoja);
        /**/
        variable.setRequiringFilter(hoja);
//      variable.setModifyingFilter(hoja);
        /**/
        amarillo.setRequiringFilter(not(hoja));
//      amarillo.setModifyingFilter(not(hoja));
        /**/
        verde.setRequiringFilter(not(hoja));
//      verde.setModifyingFilter(not(hoja));
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
