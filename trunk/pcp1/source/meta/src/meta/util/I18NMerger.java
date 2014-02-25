/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.util;

import adalid.commons.properties.PropertiesGetter;
import adalid.util.i18n.Merger;
import org.apache.commons.collections.ExtendedProperties;

/**
 * @author Jorge Campins
 */
public class I18NMerger {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        if (args.length == 0) {
            ExtendedProperties properties = PropertiesGetter.getPrivateProperties();
            args = properties.getStringArray(I18NMerger.class.getName() + ".arg");
        }
        for (int i = 0; i < args.length; i++) {
            Merger.merge(args[i]);
        }
    }

}
