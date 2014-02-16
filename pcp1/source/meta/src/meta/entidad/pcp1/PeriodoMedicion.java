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
 * PeriodoMedicion Persistent Entity.
 *
 * @author Jorge Campins
 */
public class PeriodoMedicion extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private PeriodoMedicion() {
        this(null, null);
    }

    public PeriodoMedicion(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("período de medición");
        setDefaultShortLabel("período de medición");
        setDefaultCollectionLabel("Períodos de Medición");
        setDefaultCollectionShortLabel("Períodos de Medición");
    }

    public Instance DIARIO;

    public Instance SEMANAL;

    public Instance MENSUAL;

    public Instance TRIMESTRAL;

    public Instance SEMESTRAL;

    public Instance ANUAL;

}
