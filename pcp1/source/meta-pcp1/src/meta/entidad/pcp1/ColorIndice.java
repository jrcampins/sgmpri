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
 * ColorIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
@EntityClass(independent = Kleenean.TRUE, resourceType = ResourceType.CONFIGURATION)
public class ColorIndice extends meta.entidad.base.PersistentEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private ColorIndice() {
        this(null, null);
    }

    public ColorIndice(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("color de índice");
        setDefaultShortLabel("color");
        setDefaultCollectionLabel("Colores de Indices");
        setDefaultCollectionShortLabel("Colores");
    }

    @BusinessKey
    public StringProperty codigo;

    @NumericKey
    public IntegerProperty extremoInferior;

    public Instance ROJO;

    public Instance AMARILLO;

    public Instance VERDE;

    @Override
    protected void settleProperties() {
        super.settleProperties();
        setOrderBy(extremoInferior);
    }

    @Override
    protected void settleInstances() {
        super.settleInstances();
        ROJO.newInstanceField(codigo, "Rojo");
        ROJO.newInstanceField(extremoInferior, 0);
        AMARILLO.newInstanceField(codigo, "Amarillo");
        AMARILLO.newInstanceField(extremoInferior, 50);
        VERDE.newInstanceField(codigo, "Verde");
        VERDE.newInstanceField(extremoInferior, 80);
    }

}
