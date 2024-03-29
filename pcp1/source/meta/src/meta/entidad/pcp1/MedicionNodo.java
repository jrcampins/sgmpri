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
import adalid.core.parameters.StringParameter;
import adalid.core.properties.*;
import java.lang.reflect.Field;
import meta.entidad.comun.control.acceso.Usuario;

/**
 * MedicionNodo Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityTableView(inserts = Kleenean.FALSE, updates = Kleenean.FALSE)
public class MedicionNodo extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private MedicionNodo() {
        this(null, null);
    }

    public MedicionNodo(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("medición por nodo");
        setDefaultShortLabel("medición por nodo");
        setDefaultCollectionLabel("Mediciones por Nodo");
        setDefaultCollectionShortLabel("Mediciones por Nodo");
    }

    /**
     * business key property field
     */
    @BusinessKey
    @StringField(maxLength = 50)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, defaultCondition = DefaultCondition.UNCONDITIONALLY_ON_INSERT)
    public StringProperty codigo;

    /**
     * name property field
     */
    @NameProperty
    @PropertyField(hidden = Kleenean.TRUE)
    public StringProperty nombre;

    /**
     * many-to-one entity reference property field
     */
    @SegmentProperty
    @Allocation(maxDepth = 2, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public NodoIndice nodo;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public Usuario programador;

    /**
     * date property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaProgramacion;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public Usuario anulador;

    /**
     * date property field
     */
    @PropertyField(update = Kleenean.FALSE)
    public DateProperty fechaAnulacion;

    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public CondicionMedicionNodo condicion;

    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public DateProperty fechaCondicion;

    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public StringProperty observaciones;

    @PropertyField(create = Kleenean.TRUE)
    public StringProperty comentarios;

    @Override
    protected void settleProperties() {
        super.settleProperties();
//      codigo.setInitialValue(nodo.codigo.concat("-").concat(id.toCharString()));
        codigo.setDefaultValue(nodo.codigo.concat("-").concat(id.toCharString()));
//      nombre.setInitialValue(nodo.nombre);
        nombre.setDefaultValue(nodo.nombre);
        programador.setInitialValue(SpecialEntityValue.CURRENT_USER);
        programador.setDefaultValue(SpecialEntityValue.CURRENT_USER);
        fechaProgramacion.setInitialValue(SpecialTemporalValue.CURRENT_DATE);
        fechaProgramacion.setDefaultValue(SpecialTemporalValue.CURRENT_DATE);
        condicion.setInitialValue(condicion.PROGRAMADA);
        condicion.setDefaultValue(condicion.PROGRAMADA);
        fechaCondicion.setInitialValue(SpecialTemporalValue.CURRENT_DATE);
        fechaCondicion.setDefaultValue(SpecialTemporalValue.CURRENT_DATE);
        setOrderBy(codigo);
    }

    protected Tab tab1, tab2, tab3;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(nodo, condicion, fechaCondicion, observaciones);
        tab2.setDefaultLabel("cronologia");
        tab2.newTabField(fechaProgramacion, programador, fechaAnulacion, anulador);
        tab3.setDefaultLabel("etc");
        tab3.newTabField(comentarios);
    }

    protected State programada, empezada, terminada, anulada;

    protected Check check01;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        programada = condicion.isEqualTo(condicion.PROGRAMADA);
        programada.setDefaultErrorMessage("la medición no se encuentra en condición Programada");
        empezada = condicion.isEqualTo(condicion.EMPEZADA);
        empezada.setDefaultErrorMessage("la medición no se encuentra en condición Empezada");
        terminada = condicion.isEqualTo(condicion.TERMINADA);
        terminada.setDefaultErrorMessage("la medición no se encuentra en condición Terminada");
        anulada = condicion.isEqualTo(condicion.ANULADA);
        anulada.setDefaultErrorMessage("la medición no se encuentra en condición Anulada");
        check01 = nodo.tipoNodo.isNotEqualTo(nodo.tipoNodo.HOJA);
        check01.setDefaultErrorMessage("el nodo es de tipo Hoja");
    }

    @Override
    protected void settleFilters() {
        setDeleteFilter(programada);
        nodo.setSearchQueryFilter(check01);
    }

    @Override
    protected void settleOperations() {
        super.settleOperations();
        insert.addTransition(null, programada);
        empezar.addTransition(programada, empezada);
        terminar.addTransition(programada, terminada);
        terminar.addTransition(empezada, terminada);
        anular.addTransition(empezada, anulada);
    }

    protected Recalcular recalcular;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Recalcular extends ProcessOperation {

        @InstanceReference
        protected MedicionNodo medicion;

    }

    protected Empezar empezar;

    @OperationClass(access = OperationAccess.PRIVATE)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Empezar extends ProcessOperation {

        @InstanceReference
        protected MedicionNodo medicion;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.condicion.setCurrentValue(condicion.EMPEZADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

    protected Terminar terminar;

    @OperationClass(access = OperationAccess.PRIVATE)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Terminar extends ProcessOperation {

        @InstanceReference
        protected MedicionNodo medicion;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.condicion.setCurrentValue(condicion.TERMINADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

    protected Anular anular;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Anular extends ProcessOperation {

        @InstanceReference
        protected MedicionNodo medicion;

        @ParameterField(required = Kleenean.FALSE, linkedField = "observaciones")
        protected StringParameter observaciones;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.anulador.setCurrentValue(SpecialEntityValue.CURRENT_USER);
            medicion.fechaAnulacion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
            medicion.condicion.setCurrentValue(condicion.ANULADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

    protected Chart1 chart1;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ReportOperationClass()
    public class Chart1 extends ReportOperation {

        @Override
        protected void settleAttributes() {
            super.settleAttributes();
            setDefaultLabel("distribución de frecuencias absolutas por rango");
            setDefaultShortLabel("distribución de frecuencias");

        }

        @InstanceReference
        protected MedicionNodo medicion;

        @Override
        protected void settleFilters() {
            super.settleFilters();
            medicion.setSearchQueryFilter(medicion.terminada);
        }

    }

}
