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

/**
 * CuestionarioFuente Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
public class CuestionarioFuente extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private CuestionarioFuente() {
        this(null, null);
    }

    public CuestionarioFuente(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("asociación cuestionario/fuente");
        setDefaultShortLabel("cuestionario/fuente");
        setDefaultCollectionLabel("Asociaciones Cuestionario/Fuente");
        setDefaultCollectionShortLabel("Cuestionarios/Fuentes");
//      setDefaultLabel(cuestionario, "fuente por cuestionario");
//      setDefaultShortLabel(cuestionario, "fuente");
//      setDefaultCollectionLabel(cuestionario, "Fuentes por Cuestionario");
//      setDefaultCollectionShortLabel(cuestionario, "Fuentes");
        setDefaultLabel(fuente, "cuestionario por fuente");
        setDefaultShortLabel(fuente, "cuestionario");
        setDefaultCollectionLabel(fuente, "Cuestionarios por Fuente");
        setDefaultCollectionShortLabel(fuente, "Cuestionarios");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE)
    public Cuestionario cuestionario;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    @PropertyField(required = Kleenean.TRUE)
    public Fuente fuente;

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
    @PropertyField(required = Kleenean.TRUE)
    public DateProperty fechaProximaMedicion;

    /**
     * date property field
     */
    @PropertyField(create = Kleenean.FALSE, update = Kleenean.FALSE, table = Kleenean.TRUE)
    public DateProperty fechaUltimaMedicion;

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(cuestionario, fuente);
        setOrderBy(key01);
    }

    protected Check check01;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        check01 = fechaUltimaMedicion.isNullOrLessThan(fechaProximaMedicion);
        check01.setDefaultErrorMessage("la fecha de la próxima medición debe ser mayor que la de la última medición");
    }

}
