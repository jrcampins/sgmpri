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
import adalid.core.parameters.*;
import adalid.core.properties.*;
import java.lang.reflect.Field;
import meta.entidad.comun.auditoria.ArchivoAdjunto;
import meta.entidad.comun.control.acceso.Usuario;

/**
 * MedicionFuente Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityUpdateOperation(enabled = Kleenean.FALSE)
public class MedicionFuente extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private MedicionFuente() {
        this(null, null);
    }

    public MedicionFuente(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("medición por fuente");
        setDefaultShortLabel("medición por fuente");
        setDefaultCollectionLabel("Mediciones por Fuente");
        setDefaultCollectionShortLabel("Mediciones por Fuente");
    }

    /**
     * business key property field
     */
    @BusinessKey
    @StringField(maxLength = 100)
    public StringProperty codigo;

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
    @SegmentProperty
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public Fuente fuente;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public Usuario programador;

    /**
     * date property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    public DateProperty fechaProgramada;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public Usuario registrador;

    /**
     * date property field
     */
    public DateProperty fechaRegistro;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public Usuario verificador;

    /**
     * date property field
     */
    public DateProperty fechaVerificacion;

    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public CondicionMedicionFuente condicion;

    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public DateProperty fechaCondicion;

    public StringProperty observaciones;

    @FileReference
    public StringProperty archivo;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public ArchivoAdjunto adjunto;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        medicion.setDefaultLabel("medición por nodo");
        medicion.setDefaultShortLabel("medición");
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

    protected Tab tab1, tab2, tab3;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(medicion, fuente, fechaProgramada, condicion, fechaCondicion);
        tab2.setDefaultLabel("cronologia");
        tab2.newTabField(fechaProgramada, programador, fechaRegistro, registrador, fechaVerificacion, verificador);
        tab3.setDefaultLabel("etc");
        tab3.newTabField(archivo, adjunto, observaciones);
    }

    protected State programada, registrada, aceptada, rechazada;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        programada = condicion.isEqualTo(condicion.PROGRAMADA);
        programada.setDefaultErrorMessage("la medición no se encuentra en condición Programada");
        registrada = condicion.isEqualTo(condicion.REGISTRADA);
        registrada.setDefaultErrorMessage("la medición no se encuentra en condición Registrada");
        aceptada = condicion.isEqualTo(condicion.ACEPTADA);
        aceptada.setDefaultErrorMessage("la medición no se encuentra en condición Aceptada");
        rechazada = condicion.isEqualTo(condicion.RECHAZADA);
        rechazada.setDefaultErrorMessage("la medición no se encuentra en condición Rechazada");
    }

    @Override
    protected void settleFilters() {
        setUpdateFilter(programada);
        setDeleteFilter(programada);
    }

    @Override
    protected void settleOperations() {
        super.settleOperations();
        insert.addTransition(null, programada);
        registrar.addTransition(programada, registrada);
        aceptar.addTransition(registrada, aceptada);
        rechazar.addTransition(registrada, rechazada);
    }

    Trigger programada_registrar, registrada_aceptar;

    @Override
    protected void settleTriggers() {
        super.settleTriggers();
        programada_registrar.settle(programada, registrar);
        registrada_aceptar.settle(registrada, aceptar);
    }

    protected Cargar cargar;

    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Cargar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionFuente medicion;

        @FileReference(joinField = "adjunto")
        @ParameterField(required = Kleenean.TRUE, linkedField = "archivo")
        protected StringParameter archivo;

        Check check0101;

        @Override
        protected void settleExpressions() {
            super.settleExpressions();
            check0101 = medicion.programada.isTrue();
        }

        @Override
        protected void settleFilters() {
            super.settleFilters();
            medicion.setSearchQueryFilter(check0101);
        }

    }

    protected Registrar registrar;

    @OperationClass
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Registrar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionFuente medicion;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.registrador.setCurrentValue(SpecialEntityValue.CURRENT_USER);
            medicion.fechaRegistro.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
            medicion.condicion.setCurrentValue(condicion.REGISTRADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

    protected Aceptar aceptar;

    @OperationClass
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Aceptar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionFuente medicion;

        @ParameterField(required = Kleenean.FALSE, linkedField = "observaciones")
        protected StringParameter observaciones;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.verificador.setCurrentValue(SpecialEntityValue.CURRENT_USER);
            medicion.fechaVerificacion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
            medicion.condicion.setCurrentValue(condicion.ACEPTADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

    protected Rechazar rechazar;

    @OperationClass
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Rechazar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionFuente medicion;

        @ParameterField(required = Kleenean.FALSE, linkedField = "observaciones")
        protected StringParameter observaciones;

        @Override
        protected void settleParameters() {
            super.settleParameters();
            medicion.verificador.setCurrentValue(SpecialEntityValue.CURRENT_USER);
            medicion.fechaVerificacion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
            medicion.condicion.setCurrentValue(condicion.RECHAZADA);
            medicion.fechaCondicion.setCurrentValue(SpecialTemporalValue.CURRENT_DATE);
        }

    }

}
