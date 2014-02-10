/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.entidad.pcp1;

import adalid.core.*;
import adalid.core.interfaces.*;
import java.lang.reflect.Field;

/**
 * ColorIndice Persistent Entity.
 *
 * @author Jorge Campins
 */
public class ColorIndice extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private ColorIndice() {
        this(null, null);
    }

    public ColorIndice(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    public Instance ROJO;

    public Instance AMARILLO;

    public Instance VERDE;

}
