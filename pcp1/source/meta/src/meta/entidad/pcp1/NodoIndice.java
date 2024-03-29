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
    @PropertyField(create = Kleenean.TRUE, table = Kleenean.FALSE, report = Kleenean.TRUE, required = Kleenean.TRUE, submit = Kleenean.TRUE)
    public TipoNodo tipoNodo;

    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.FALSE, report = Kleenean.FALSE)
    public IntegerProperty subordinados;

    /**
     * parent entity reference property field
     */
    @ParentProperty
    @Allocation(maxDepth = 2, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public NodoIndice superior;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE)
    public Variable variable;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE, update = Kleenean.TRUE, table = Kleenean.FALSE, report = Kleenean.FALSE)
    public TipoPesoNodo tipoPesoNodo;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.TRUE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public ImpactoNodo impacto;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 16, scale = 13)
    @ColumnField(nullable = Kleenean.TRUE)
    @PropertyField(create = Kleenean.TRUE, table = Kleenean.FALSE, report = Kleenean.FALSE)
    public BigDecimalProperty pesoAsignado;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 16, scale = 13)
    @ColumnField(nullable = Kleenean.TRUE, insertable = Kleenean.FALSE, updateable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.FALSE, report = Kleenean.FALSE)
    public BigDecimalProperty pesoAHP;

    /**
     * big decimal property field
     */
    @BigDecimalField(precision = 16, scale = 13)
    @ColumnField(nullable = Kleenean.TRUE, insertable = Kleenean.FALSE, updateable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.FALSE, report = Kleenean.FALSE)
    public BigDecimalProperty pesoSimplificado;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        tipoNodo.setInitialValue(tipoNodo.RAIZ);
        tipoNodo.setDefaultValue(tipoNodo.RAIZ);
//      tipoPesoNodo.setInitialValue(tipoPesoNodo.INDETERMINADO);
        tipoPesoNodo.setDefaultValue(tipoNodo.isEqualTo(tipoNodo.RAIZ).then(tipoPesoNodo.INDETERMINADO).otherwise(superior.tipoPesoNodo));
        impacto.setInitialValue(impacto.ALTO);
        impacto.setDefaultValue(impacto.ALTO);
        pesoAsignado.setDefaultDescription("peso por asignación directa");
        pesoAHP.setDefaultLabel("peso AHP");
        pesoAHP.setDefaultDescription("peso calculado con el método de la técnica AHP");
        pesoSimplificado.setDefaultDescription("peso calculado con el método simplificado");
        subordinados.setInitialValue(0);
        subordinados.setDefaultValue(0);
        setOrderBy(codigo);
    }

    protected Tab tab1, tab2, tab3, tab4;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(tipoNodo, subordinados);
        tab2.setDefaultLabel("general");
        tab2.newTabField(tipoNodo, superior, subordinados);
        tab3.setDefaultLabel("general");
        tab3.newTabField(tipoNodo, superior, variable);
        tab4.setDefaultLabel("pesos");
        tab4.newTabField(tipoPesoNodo, impacto, pesoAsignado, pesoAHP, pesoSimplificado);
    }

    protected Segment raiz, rama, hoja;

    protected Segment raizRama, subordinadosMayor, subordinadosMenor;

    protected Check check01, check02, check03, check05, check07, check08;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        raiz = tipoNodo.isEqualTo(tipoNodo.RAIZ);
        raiz.setDefaultErrorMessage("el nodo no es de tipo Raiz");
        rama = tipoNodo.isEqualTo(tipoNodo.RAMA);
        rama.setDefaultErrorMessage("el nodo no es de tipo Rama");
        hoja = tipoNodo.isEqualTo(tipoNodo.HOJA);
        hoja.setDefaultErrorMessage("el nodo no es de tipo Hoja");
        /**/
        raizRama = not(hoja);
        raizRama.setDefaultErrorMessage("el nodo es de tipo Hoja");
        /**/
        subordinadosMayor = and(not(hoja), subordinados.isGreaterThan(20));
        subordinadosMayor.setDefaultErrorMessage("el nodo no tiene mas de 20 nodos subordinados");
        subordinadosMenor = and(not(hoja), subordinados.isGreaterThan(1), subordinados.isLessOrEqualTo(20));
        subordinadosMenor.setDefaultErrorMessage("el nodo no tiene nodos subordinados o tiene mas de 20");
        /**/
        check01 = raiz.xnor(superior.isNull());
        check01.setDefaultErrorMessage("el nodo superior se debe especificar si y solo si el tipo de nodo no es Raiz");
        check02 = this.isNull().or(superior.isNullOrNotEqualTo(this));
        check02.setDefaultErrorMessage("el nodo superior no puede ser este mismo nodo");
        check03 = superior.isNotNull().implies(superior.tipoNodo.isNotEqualTo(tipoNodo.HOJA));
        check03.setDefaultErrorMessage("el nodo superior no puede ser un nodo de tipo Hoja");
//      check04 = raiz.implies(tipoPesoNodo.isNullOrEqualTo(tipoPesoNodo.INDETERMINADO));
//      check04.setDefaultErrorMessage("el tipo del peso del nodo debe ser Indeterminado si el tipo de nodo es Raiz");
        check05 = hoja.xnor(variable.isNotNull());
        check05.setDefaultErrorMessage("la variable se debe especificar si y solo si el tipo de nodo es Hoja");
//      check06 = tipoPesoNodo.isEqualTo(tipoPesoNodo.ASIGNACION_DIRECTA).implies(pesoAsignado.isNotNull());
//      check06.setDefaultErrorMessage("el peso asignado del nodo se debe especificar si el tipo del peso del nodo es Asignación Directa");
        check07 = pesoAsignado.isNullOrGreaterThan(0);
        check07.setDefaultErrorMessage("el peso asignado es menor o igual a 0");
        check08 = pesoAsignado.isNullOrLessOrEqualTo(100);
        check08.setDefaultErrorMessage("el peso asignado es mayor que 100");
    }

    @Override
    protected void settleFilters() {
        super.settleFilters();
        tab1.setRenderingFilter(raiz);
        tab2.setRenderingFilter(rama);
        tab3.setRenderingFilter(hoja);
        /**/
//      superior.setRenderingFilter(not(raiz));
        superior.setRequiringFilter(not(raiz));
        superior.setModifyingFilter(not(raiz));
        superior.setNullifyingFilter(raiz);
        /**/
//      tipoPesoNodo.setRenderingFilter(tipoNodo.isNull());
        tipoPesoNodo.setRequiringFilter(tipoNodo.isNull());
        tipoPesoNodo.setModifyingFilter(tipoNodo.isNull());
        /**/
//      impacto.setRenderingFilter(not(raiz));
        impacto.setRequiringFilter(not(raiz));
        impacto.setModifyingFilter(not(raiz));
//      impacto.setNullifyingFilter(raiz);
        /**/
//      pesoAsignado.setRenderingFilter(not(raiz));
        pesoAsignado.setRequiringFilter(tipoPesoNodo.isEqualTo(tipoPesoNodo.ASIGNACION_DIRECTA));
        pesoAsignado.setModifyingFilter(not(raiz));
        pesoAsignado.setNullifyingFilter(raiz);
        /**/
//      variable.setRenderingFilter(hoja);
        variable.setRequiringFilter(hoja);
        variable.setModifyingFilter(hoja);
        variable.setNullifyingFilter(not(hoja));
    }

    protected ActualizarTipoPesoNodo actualizarTipoPeso;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class ActualizarTipoPesoNodo extends ProcessOperation {

        @InstanceReference
        protected NodoIndice nodo;

        @ParameterField(required = Kleenean.TRUE, linkedField = "tipoPesoNodo")
        protected TipoPesoNodo tipoPesoNodo;

        Check check01;

        @Override
        protected void settleExpressions() {
            super.settleExpressions();
            check01 = nodo.raiz.isTrue();
        }

        @Override
        protected void settleFilters() {
            super.settleFilters();
            nodo.setSearchQueryFilter(check01);
        }

    }

    protected Recalcular recalcular;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Recalcular extends ProcessOperation {

        @InstanceReference
        protected NodoIndice nodo;

        Check check01;

        @Override
        protected void settleExpressions() {
            super.settleExpressions();
            check01 = nodo.raiz.isTrue();
        }

        @Override
        protected void settleFilters() {
            super.settleFilters();
            nodo.setSearchQueryFilter(check01);
        }

    }

}
