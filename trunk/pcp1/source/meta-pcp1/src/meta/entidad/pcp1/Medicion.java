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
 * Medicion Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityUpdateOperation(enabled = Kleenean.FALSE)
public class Medicion extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private Medicion() {
        this(null, null);
    }

    public Medicion(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("medición");
        setDefaultShortLabel("medición");
        setDefaultCollectionLabel("Mediciones");
        setDefaultCollectionShortLabel("Mediciones");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.TRUE, update = Kleenean.FALSE)
    public Cuestionario cuestionario;

    /**
     * many-to-one entity reference property field
     */
    @SegmentProperty
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.TRUE, update = Kleenean.FALSE)
    public Fuente fuente;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public Usuario programador;

    /**
     * date property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaProgramada;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public Usuario registrador;

    /**
     * date property field
     */
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaRegistro;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public Usuario verificador;

    /**
     * date property field
     */
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaVerificacion;

    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public CondicionMedicion condicion;

    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaCondicion;

    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public StringProperty observaciones;

    @FileReference
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.TRUE, report = Kleenean.TRUE)
    public StringProperty archivo;

    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(sequence = 1, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public ArchivoAdjunto adjunto;

    /**
     * business key property field
     */
    @BusinessKey
    @StringField(maxLength = 100)
    @PropertyField(sequence = 0, create = Kleenean.FALSE, update = Kleenean.FALSE)
    public StringProperty codigo;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        codigo.setDefaultValue(fuente.codigo.concat("-").concat(cuestionario.codigo).concat("-").concat(fechaProgramada.toCharString()));
        programador.setInitialValue(SpecialEntityValue.CURRENT_USER);
        programador.setDefaultValue(SpecialEntityValue.CURRENT_USER);
        fechaProgramada.setInitialValue(SpecialTemporalValue.CURRENT_DATE);
        fechaProgramada.setDefaultValue(SpecialTemporalValue.CURRENT_DATE);
        condicion.setInitialValue(condicion.PROGRAMADA);
        condicion.setDefaultValue(condicion.PROGRAMADA);
        fechaCondicion.setInitialValue(SpecialTemporalValue.CURRENT_DATE);
        fechaCondicion.setDefaultValue(SpecialTemporalValue.CURRENT_DATE);
    }

    protected Tab tab1, tab2, tab3;

    @Override
    protected void settleTabs() {
        super.settleTabs();
        tab1.setDefaultLabel("general");
        tab1.newTabField(cuestionario, fuente, fechaProgramada, condicion, fechaCondicion);
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
        programada.setDefaultErrorMessage("el registro no se encuentra en condición Programada");
        registrada = condicion.isEqualTo(condicion.REGISTRADA);
        registrada.setDefaultErrorMessage("el registro no se encuentra en condición Registrada");
        aceptada = condicion.isEqualTo(condicion.ACEPTADA);
        aceptada.setDefaultErrorMessage("el registro no se encuentra en condición Aceptada");
        rechazada = condicion.isEqualTo(condicion.RECHAZADA);
        rechazada.setDefaultErrorMessage("el registro no se encuentra en condición Rechazada");
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
        protected Medicion medicion;

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
        protected Medicion medicion;

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
        protected Medicion medicion;

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
        protected Medicion medicion;

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
