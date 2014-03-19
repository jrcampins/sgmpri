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
 * MedicionRama Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityDeleteOperation(enabled = Kleenean.FALSE)
@EntityTableView(inserts = Kleenean.FALSE, updates = Kleenean.FALSE)
public class MedicionRama extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private MedicionRama() {
        this(null, null);
    }

    public MedicionRama(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("medición por rama");
        setDefaultShortLabel("medición por rama");
        setDefaultCollectionLabel("Mediciones por Rama");
        setDefaultCollectionShortLabel("Mediciones por Rama");
    }

    /**
     * business key property field
     */
    @BusinessKey
    @StringField(maxLength = 50)
    @PropertyField(update = Kleenean.FALSE)
    public StringProperty codigo;

    /**
     * name property field
     */
    @NameProperty
    @PropertyField(update = Kleenean.FALSE)
    public StringProperty nombre;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE_AND_DETAIL)
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
    @PropertyField(update = Kleenean.FALSE)
    public NodoIndice rama;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public Usuario registrador;

    /**
     * date property field
     */
    @PropertyField(update = Kleenean.FALSE)
    public DateProperty fechaRegistro;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public Usuario verificador;

    /**
     * date property field
     */
    @PropertyField(update = Kleenean.FALSE)
    public DateProperty fechaVerificacion;

    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public CondicionMedicionRama condicion;

    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE, update = Kleenean.FALSE)
    public DateProperty fechaCondicion;

    @PropertyField(update = Kleenean.FALSE)
    public StringProperty observaciones;

    @FileReference
    @PropertyField(update = Kleenean.FALSE)
    public StringProperty archivo;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public ArchivoAdjunto adjunto;

    public StringProperty comentarios;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        medicion.setDefaultLabel("medición por nodo");
        medicion.setDefaultShortLabel("medición");
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
        tab1.newTabField(medicion, rama, condicion, fechaCondicion, observaciones);
        tab2.setDefaultLabel("cronologia");
        tab2.newTabField(fechaRegistro, registrador, fechaVerificacion, verificador);
        tab3.setDefaultLabel("etc");
        tab3.newTabField(archivo, adjunto, comentarios);
    }

    protected State programada, registrada, aceptada, rechazada, anulada;

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
        anulada = condicion.isEqualTo(condicion.ANULADA);
        anulada.setDefaultErrorMessage("la medición no se encuentra en condición Anulada");
    }

    @Override
    protected void settleOperations() {
        super.settleOperations();
        insert.addTransition(null, programada);
        registrar.addTransition(programada, registrada);
        registrar.addTransition(rechazada, registrada);
        aceptar.addTransition(registrada, aceptada);
        rechazar.addTransition(registrada, rechazada);
    }

    Trigger programada_registrar, registrada_aceptar, rechazada_registrar;

    @Override
    protected void settleTriggers() {
        super.settleTriggers();
        programada_registrar.settle(programada, registrar);
        registrada_aceptar.settle(registrada, aceptar);
        rechazada_registrar.settle(rechazada, registrar);
    }

    protected Cargar cargar;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Cargar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionRama medicion;

        @FileReference(joinField = "adjunto")
        @ParameterField(required = Kleenean.TRUE, linkedField = "archivo")
        protected StringParameter archivo;

    }

    protected Registrar registrar;

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Registrar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionRama medicion;

        @ParameterField(required = Kleenean.FALSE, linkedField = "observaciones")
        protected StringParameter observaciones;

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

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Aceptar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionRama medicion;

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

    @OperationClass(access = OperationAccess.RESTRICTED)
    @ProcessOperationClass(overloading = Kleenean.FALSE)
    public class Rechazar extends ProcessOperation {

        @InstanceReference
        @Allocation(maxDepth = 1, maxRound = 0)
        protected MedicionRama medicion;

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
