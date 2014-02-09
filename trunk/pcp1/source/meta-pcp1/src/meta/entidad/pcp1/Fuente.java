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
 * Fuente Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
public class Fuente extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private Fuente() {
        this(null, null);
    }

    public Fuente(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

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
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public TipoNodo tipoNodo;

    /**
     * parent entity reference property field
     */
    @ParentProperty
    @Allocation(maxDepth = 1, maxRound = 0)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(table = Kleenean.TRUE, report = Kleenean.TRUE)
    public Fuente superior;

    public IntegerProperty numero;

    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public StringProperty clave;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        tipoNodo.setInitialValue(tipoNodo.RAIZ);
        tipoNodo.setDefaultValue(tipoNodo.RAIZ);
        numero.setMinValue(1);
        numero.setMaxValue(100);
    }

}
