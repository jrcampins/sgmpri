/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
package meta.proyecto.pcp1;

import adalid.commons.enums.LoggingLevel;
import adalid.core.annotations.ProjectModule;
import adalid.core.enums.Kleenean;
import java.util.Locale;
import meta.proyecto.base.ProyectoBase;
import meta.proyecto.comun.Auditoria;
import meta.proyecto.comun.ControlAcceso;
import meta.proyecto.comun.ControlPruebas;

/**
 * @author Jorge Campins
 */
public class Maestro extends ProyectoBase {

    public static void main(String[] args) {
//      Maestro.setLocale(Locale.ENGLISH);
        Maestro.setLocale(Locale.forLanguageTag("es"));
        Maestro.setAlertLoggingLevel(LoggingLevel.OFF);
//      Maestro.setDetailLoggingLevel(LoggingLevel.INFO);
//      Maestro.setTrackingLoggingLevel(LoggingLevel.INFO);
        Maestro maestro = new Maestro();
        maestro.setDefaultLabel("Gestión de Mantenimiento y Preservación de Recursos Industriales");
        maestro.setDefaultDescription("Sistema de Gestión de Mantenimiento y Preservación de Recursos Industriales");
        if (maestro.build()) {
            maestro.setAlias("pcp1ap101");
//          maestro.generate(PLATAFORMA_BASE);
            maestro.generate("jee1af101"); // jee1af101: netbeans, postgresql, glassfish
        }
    }

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo1 mod1;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo2 mod2;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo3 mod3;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo4 mod4;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo5 mod5;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo6 mod6;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo7 mod7;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo8 mod8;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Modulo9 mod9;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    ControlAcceso modx;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    Auditoria mody;

    @ProjectModule(menu = Kleenean.TRUE, role = Kleenean.TRUE)
    ControlPruebas modz;

}
