/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.entidad.pcp1;

import adalid.core.annotations.*;
import adalid.core.enums.*;
import adalid.core.interfaces.*;
import adalid.core.properties.DateProperty;
import adalid.core.properties.StringProperty;
import java.lang.reflect.Field;

/**
 * CuestionarioInstalacion Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.OPERATION)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityDeleteOperation(enabled = Kleenean.FALSE)
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

    /**
     * business key property field
     */
    @BusinessKey
    @StringField(maxLength = 100)
    @PropertyField(update = Kleenean.FALSE)
    public StringProperty codigo;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public Cuestionario cuestionario;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(update = Kleenean.FALSE)
    public Instalacion instalacion;

    /**
     * date property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(update = Kleenean.FALSE)
    public DateProperty fechaProgramada;

    /**
     * date property field
     */
    @PropertyField(update = Kleenean.FALSE)
    public DateProperty fechaInicio;

    /**
     * date property field
     */
    @PropertyField(update = Kleenean.FALSE)
    public DateProperty fechaFin;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        codigo.setDefaultValue(instalacion.codigo.concat("-").concat(cuestionario.codigo).concat("-").concat(fechaProgramada.toCharString()));
    }

}
