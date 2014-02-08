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
import adalid.core.properties.*;
import java.lang.reflect.Field;
import meta.entidad.comun.configuracion.basica.TipoNodo;

/**
 * Cuestionario Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
@EntityDataGen(start = 1, stop = 10, step = 1)
public class Instalacion extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private Instalacion() {
        this(null, null);
    }

    public Instalacion(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    /**
     * business key property field
     */
    @BusinessKey
    @CharacterDataGen(function = "util.string_codigo_entidad", nullable = 0)
    public StringProperty codigo;

    /**
     * name property field
     */
    @NameProperty
    @CharacterDataGen(function = "util.string_nombre_entidad", nullable = 0)
    public StringProperty nombre;

    /**
     * parent entity reference property field
     */
    @ParentProperty
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.TRUE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    @EntityReferenceDataGen(nullable = 100)
    public Instalacion superior;

    @NumericDataGen(nullable = 100)
    public IntegerProperty numero;

    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    @CharacterDataGen(nullable = 100)
    public StringProperty clave;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.TRUE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    @EntityReferenceDataGen(nullable = 100)
    public TipoNodo tipoNodo;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        numero.setMinValue(1);
        numero.setMaxValue(100);
    }

}
