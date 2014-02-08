/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.proyecto.pcp1;

import adalid.core.Project;
import meta.entidad.pcp1.*;

/**
 * @author Jorge Campins
 */
public class Modulo1 extends Project {

    {
        setAlias("Medicion");
        setDefaultLabel("Medición");
        setDefaultDescription("Medición");
    }

    Variable variable;

    VariableTangible variableTangible;

    VariableIntangible variableIntangible;

    RangoVariable rangoVariable;

    Cuestionario cuestionario;

    CuestionarioVariable cuestionarioVariable;

}
