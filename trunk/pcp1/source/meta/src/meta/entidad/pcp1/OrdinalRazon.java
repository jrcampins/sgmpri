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
import adalid.core.properties.BigDecimalProperty;
import java.lang.reflect.Field;

/**
 * OrdinalRazon Persistent Entity.
 *
 * @author Jorge Campins
 */
public class OrdinalRazon extends meta.entidad.base.PersistentEnumerationEntityBase {

    // <editor-fold defaultstate="collapsed" desc="class constructors">
    @Deprecated()
    private OrdinalRazon() {
        this(null, null);
    }

    public OrdinalRazon(Artifact declaringArtifact, Field declaringField) {
        super(declaringArtifact, declaringField);
    }
    // </editor-fold>

    @ColumnField(nullable = Kleenean.TRUE)
    @BigDecimalField(precision = 16, scale = 13)
    @PropertyField(required = Kleenean.TRUE, search = Kleenean.FALSE)
    public BigDecimalProperty razon;

    /**
     * one-to-one entity reference property field
     */
    @Allocation(maxDepth = 1, maxRound = 0)
    @ColumnField(nullable = Kleenean.FALSE)
    @ForeignKey(onDelete = OnDeleteAction.NONE, onUpdate = OnUpdateAction.NONE)
    @OneToOne(navigability = Navigability.UNIDIRECTIONAL)
    public OrdinalRazon inversa;

    @Override
    protected void settleAttributes() {
        super.settleAttributes();
        setDefaultLabel("ordinal de comparación");
        setDefaultShortLabel("ordinal de comparación");
        setDefaultCollectionLabel("Escala Ordinal de Comparación");
        setDefaultCollectionShortLabel("Escala Ordinal de Comparación");
    }

    public Instance UNO;

    public Instance DOS;

    public Instance TRES;

    public Instance CUATRO;

    public Instance CINCO;

    public Instance SEIS;

    public Instance SIETE;

    public Instance OCHO;

    public Instance NUEVE;

    public Instance MEDIO;

    public Instance TERCIO;

    public Instance CUARTO;

    public Instance QUINTO;

    public Instance SEXTO;

    public Instance SEPTIMO;

    public Instance OCTAVO;

    public Instance NOVENO;

    @Override
    protected void settleInstances() {
        super.settleInstances();
        UNO.newInstanceField(codigo, "1");
        DOS.newInstanceField(codigo, "2");
        TRES.newInstanceField(codigo, "3");
        CUATRO.newInstanceField(codigo, "4");
        CINCO.newInstanceField(codigo, "5");
        SEIS.newInstanceField(codigo, "6");
        SIETE.newInstanceField(codigo, "7");
        OCHO.newInstanceField(codigo, "8");
        NUEVE.newInstanceField(codigo, "9");
        MEDIO.newInstanceField(codigo, "1/2");
        TERCIO.newInstanceField(codigo, "1/3");
        CUARTO.newInstanceField(codigo, "1/4");
        QUINTO.newInstanceField(codigo, "1/5");
        SEXTO.newInstanceField(codigo, "1/6");
        SEPTIMO.newInstanceField(codigo, "1/7");
        OCTAVO.newInstanceField(codigo, "1/8");
        NOVENO.newInstanceField(codigo, "1/9");
        /**/
        UNO.newInstanceField(razon, 1);
        DOS.newInstanceField(razon, 2);
        TRES.newInstanceField(razon, 3);
        CUATRO.newInstanceField(razon, 4);
        CINCO.newInstanceField(razon, 5);
        SEIS.newInstanceField(razon, 6);
        SIETE.newInstanceField(razon, 7);
        OCHO.newInstanceField(razon, 8);
        NUEVE.newInstanceField(razon, 9);
        MEDIO.newInstanceField(razon, 1.0 / 2);
        TERCIO.newInstanceField(razon, 1.0 / 3);
        CUARTO.newInstanceField(razon, 1.0 / 4);
        QUINTO.newInstanceField(razon, 1.0 / 5);
        SEXTO.newInstanceField(razon, 1.0 / 6);
        SEPTIMO.newInstanceField(razon, 1.0 / 7);
        OCTAVO.newInstanceField(razon, 1.0 / 8);
        NOVENO.newInstanceField(razon, 1.0 / 9);
        /**/
        UNO.newInstanceField(inversa, UNO);
        DOS.newInstanceField(inversa, MEDIO);
        TRES.newInstanceField(inversa, TERCIO);
        CUATRO.newInstanceField(inversa, CUARTO);
        CINCO.newInstanceField(inversa, QUINTO);
        SEIS.newInstanceField(inversa, SEXTO);
        SIETE.newInstanceField(inversa, SEPTIMO);
        OCHO.newInstanceField(inversa, OCTAVO);
        NUEVE.newInstanceField(inversa, NOVENO);
        MEDIO.newInstanceField(inversa, DOS);
        TERCIO.newInstanceField(inversa, TRES);
        CUARTO.newInstanceField(inversa, CUATRO);
        QUINTO.newInstanceField(inversa, CINCO);
        SEXTO.newInstanceField(inversa, SEIS);
        SEPTIMO.newInstanceField(inversa, SIETE);
        OCTAVO.newInstanceField(inversa, OCHO);
        NOVENO.newInstanceField(inversa, NUEVE);
        /**/
        MEDIO.newInstanceField(numero, 12);
        TERCIO.newInstanceField(numero, 13);
        CUARTO.newInstanceField(numero, 14);
        QUINTO.newInstanceField(numero, 15);
        SEXTO.newInstanceField(numero, 16);
        SEPTIMO.newInstanceField(numero, 17);
        OCTAVO.newInstanceField(numero, 18);
        NOVENO.newInstanceField(numero, 19);
    }

}
