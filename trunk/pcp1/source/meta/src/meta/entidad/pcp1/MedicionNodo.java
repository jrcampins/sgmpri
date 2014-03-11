/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.entidad.pcp1;

import adalid.core.ProcessOperation;
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
@EntityUpdateOperation(enabled = Kleenean.FALSE)
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
        setDefaultCollectionShortLabel("Mediciones");
    }

    /**
     * business key property field
     */
    @BusinessKey
    @StringField(maxLength = 100)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, defaultCondition = DefaultCondition.UNCONDITIONALLY)
    public StringProperty codigo;

    /**
     * many-to-one entity reference property field
     */
    @SegmentProperty
    @Allocation(maxDepth = 2, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
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
    public DateProperty fechaProgramada;

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

    @Override
    protected void settleProperties() {
        super.settleProperties();
//      codigo.setInitialValue(nodo.codigo.concat("-").concat(id.toCharString()));
        codigo.setDefaultValue(nodo.codigo.concat("-").concat(id.toCharString()));
        programador.setInitialValue(SpecialEntityValue.CURRENT_USER);
        programador.setDefaultValue(SpecialEntityValue.CURRENT_USER);
        fechaProgramada.setInitialValue(SpecialTemporalValue.CURRENT_DATE);
        fechaProgramada.setDefaultValue(SpecialTemporalValue.CURRENT_DATE);
        condicion.setInitialValue(condicion.PROGRAMADA);
        condicion.setDefaultValue(condicion.PROGRAMADA);
        fechaCondicion.setInitialValue(SpecialTemporalValue.CURRENT_DATE);
        fechaCondicion.setDefaultValue(SpecialTemporalValue.CURRENT_DATE);
        setOrderBy(codigo);
    }

    protected State programada, empezada, terminada, cancelada;

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
        cancelada = condicion.isEqualTo(condicion.CANCELADA);
        cancelada.setDefaultErrorMessage("la medición no se encuentra en condición Cancelada");
        check01 = nodo.tipoNodo.isNotEqualTo(nodo.tipoNodo.HOJA);
        check01.setDefaultErrorMessage("el nodo es de tipo Hoja");
    }

    @Override
    protected void settleFilters() {
        setUpdateFilter(programada);
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
        cancelar.addTransition(empezada, cancelada);
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

    protected Cancelar cancelar;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Cancelar extends ProcessOperation {

        @InstanceReference
        protected MedicionNodo medicion;

        @ParameterField(required = Kleenean.FALSE, linkedField = "observaciones")
        protected StringParameter observaciones;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.condicion.setCurrentValue(condicion.CANCELADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

}
