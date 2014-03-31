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

/**
 * RazonNodoIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.FALSE, resourceType = ResourceType.CONFIGURATION)
@EntitySelectOperation(enabled = Kleenean.FALSE)
@EntityInsertOperation(enabled = Kleenean.FALSE)
@EntityDeleteOperation(enabled = Kleenean.FALSE)
@EntityTableView(rows = 20)
@PersistentEntityClass(dataProvider = 3)
public class FilaMatrizRazon extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private FilaMatrizRazon() {
        this(null, null);
    }

    public FilaMatrizRazon(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("fila de matriz de razón de nodo de índice");
        setDefaultShortLabel("fila de matriz de razón");
        setDefaultCollectionLabel("Filas de Matrices de Razones de Nodos de Indices");
        setDefaultCollectionShortLabel("Filas de Matrices de Razones");
    }

    /**
     * business key property field
     */
    @BusinessKey
    @PropertyField(update = Kleenean.FALSE)
    public StringProperty codigo;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.CASCADE, onUpdate = OnUpdateAction.CASCADE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.TABLE)
    @PropertyField(update = Kleenean.FALSE)
    public NodoIndice nodo;

    @PropertyField(hidden = Kleenean.TRUE)
    public IntegerProperty fila;

    @PropertyField(hidden = Kleenean.TRUE)
    public IntegerProperty dimension;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c01;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c02;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c03;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c04;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c05;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c06;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c07;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c08;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c09;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c10;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c11;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c12;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c13;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c14;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c15;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c16;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c17;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c18;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c19;

    /**
     * many-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @ManyToOne(navigability = Navigability.UNIDIRECTIONAL, view = MasterDetailView.NONE)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE, headertextless = Kleenean.TRUE)
    public OrdinalRazon c20;

    @PropertyField(hidden = Kleenean.TRUE)
    public StringProperty etiquetas;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        codigo.setDefaultLabel("nodo");
        c01.setInitialValue(c01.UNO);
        c01.setDefaultValue(c01.UNO);
        c02.setInitialValue(c02.UNO);
        c02.setDefaultValue(c02.UNO);
        c03.setInitialValue(c03.UNO);
        c03.setDefaultValue(c03.UNO);
        c04.setInitialValue(c04.UNO);
        c04.setDefaultValue(c04.UNO);
        c05.setInitialValue(c05.UNO);
        c05.setDefaultValue(c05.UNO);
        c06.setInitialValue(c06.UNO);
        c06.setDefaultValue(c06.UNO);
        c07.setInitialValue(c07.UNO);
        c07.setDefaultValue(c07.UNO);
        c08.setInitialValue(c08.UNO);
        c08.setDefaultValue(c08.UNO);
        c09.setInitialValue(c09.UNO);
        c09.setDefaultValue(c09.UNO);
        c10.setInitialValue(c10.UNO);
        c10.setDefaultValue(c10.UNO);
        c11.setInitialValue(c11.UNO);
        c11.setDefaultValue(c11.UNO);
        c12.setInitialValue(c12.UNO);
        c12.setDefaultValue(c12.UNO);
        c13.setInitialValue(c13.UNO);
        c13.setDefaultValue(c13.UNO);
        c14.setInitialValue(c14.UNO);
        c14.setDefaultValue(c14.UNO);
        c15.setInitialValue(c15.UNO);
        c15.setDefaultValue(c15.UNO);
        c16.setInitialValue(c16.UNO);
        c16.setDefaultValue(c16.UNO);
        c17.setInitialValue(c17.UNO);
        c17.setDefaultValue(c17.UNO);
        c18.setInitialValue(c18.UNO);
        c18.setDefaultValue(c18.UNO);
        c19.setInitialValue(c19.UNO);
        c19.setDefaultValue(c19.UNO);
        c20.setInitialValue(c20.UNO);
        c20.setDefaultValue(c20.UNO);
        setMasterDetailFilter(nodo.raizRama);
        setOrderBy(codigo);
    }

}
