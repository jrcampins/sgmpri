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
import adalid.core.properties.DateProperty;
import java.lang.reflect.Field;

/**
 * CuestionarioInstalacion Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
public class CuestionarioInstalacion extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private CuestionarioInstalacion() {
        this(null, null);
    }

    public CuestionarioInstalacion(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("asociación cuestionario/instalación");
        setDefaultShortLabel("cuestionario/instalación");
        setDefaultCollectionLabel("Asociaciones Cuestionario/Instalación");
        setDefaultCollectionShortLabel("Cuestionarios/Instalaciones");
        setDefaultLabel(cuestionario, "instalación por cuestionario");
        setDefaultShortLabel(cuestionario, "instalación");
        setDefaultCollectionLabel(cuestionario, "Instalaciones por Cuestionario");
        setDefaultCollectionShortLabel(cuestionario, "Instalaciones");
        setDefaultLabel(instalacion, "cuestionario por instalación");
        setDefaultShortLabel(instalacion, "cuestionario");
        setDefaultCollectionLabel(instalacion, "Cuestionarios por Instalación");
        setDefaultCollectionShortLabel(instalacion, "Cuestionarios");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE)
    public Cuestionario cuestionario;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE_AND_DETAIL)
    @PropertyField(required = Kleenean.TRUE)
    public Instalacion instalacion;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE)
    public PeriodoMedicion periodo;

    /**
     * date property field
     */
    @ColumnField(nullable = Kleenean.FALSE)
    @PropertyField(required = Kleenean.TRUE, update = Kleenean.FALSE)
    public DateProperty fechaPrimeraMedicion;

    /**
     * date property field
     */
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaUltimaMedicion;

    /**
     * date property field
     */
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE)
    public DateProperty fechaProximaMedicion;

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(cuestionario, instalacion);
    }

}
