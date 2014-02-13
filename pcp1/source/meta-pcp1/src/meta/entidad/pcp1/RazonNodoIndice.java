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
 * RazonNodoIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
public class RazonNodoIndice extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private RazonNodoIndice() {
        this(null, null);
    }

    public RazonNodoIndice(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("razón de nodo de índice");
        setDefaultShortLabel("razón de nodo");
        setDefaultCollectionLabel("Razones de Nodos de Indices");
        setDefaultCollectionShortLabel("Razones de Nodos");
    }

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    public NodoIndice nodo;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 2, maxRound = 1)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public NodoIndice numerador;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 2, maxRound = 1)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    public NodoIndice denominador;

    @ColumnField(nullable = Kleenean.TRUE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE)
    public BigDecimalProperty razon;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        razon.setDefaultValue(numerador.isEqualTo(denominador).then(1));
    }

    protected Key key01;

    @Override
    protected void settleKeys() {
        super.settleKeys();
        key01.setUnique(true);
        key01.newKeyField(nodo, numerador, denominador);
        setOrderBy(key01);
    }

    protected Check check01, check02, check03;

    @Override
    protected void settleExpressions() {
        super.settleExpressions();
        check01 = nodo.isEqualTo(numerador.superior);
        check01.setDefaultErrorMessage("el numerador no es un subordinado del nodo");
        check02 = nodo.isEqualTo(denominador.superior);
        check02.setDefaultErrorMessage("el denominador no es un subordinado del nodo");
        check03 = numerador.isNotEqualTo(denominador);
        check03.setDefaultErrorMessage("el numerador es igual al denominador");
    }

}
