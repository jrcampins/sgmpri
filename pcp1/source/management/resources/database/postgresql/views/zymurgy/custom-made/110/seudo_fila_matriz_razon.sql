drop view if exists seudo_fila_matriz_razon cascade;
create view seudo_fila_matriz_razon as
select *
from razon_nodo_indice$crosstab()
as fila_matriz_razon (id bigint, version bigint, codigo character varying, nodo bigint, fila integer, dimension integer,
c01 integer, c02 integer, c03 integer, c04 integer, c05 integer, c06 integer, c07 integer, c08 integer, c09 integer, c10 integer,
c11 integer, c12 integer, c13 integer, c14 integer, c15 integer, c16 integer, c17 integer, c18 integer, c19 integer, c20 integer,
claves character varying, etiquetas character varying)
order by nodo, fila;

drop function if exists seudo_fila_matriz_razon_instead() cascade;
create or replace function seudo_fila_matriz_razon_instead() returns trigger as $$
declare
    _msg character varying;
    _vista character varying := 'seudo_fila_matriz_razon';
    _clave character varying[];
    _denominador bigint;
begin
    raise notice '% seudo_fila_matriz_razon', TG_OP;
    if TG_OP = 'UPDATE' then
        _clave := regexp_split_to_array(new.claves, E'\n');
        if new.fila < 02 then
            _denominador := cast(_clave[02] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c02
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c02;
        end if;
        if new.fila < 03 then
            _denominador := cast(_clave[03] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c03
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c03;
        end if;
        if new.fila < 04 then
            _denominador := cast(_clave[04] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c04
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c04;
        end if;
        if new.fila < 05 then
            _denominador := cast(_clave[05] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c05
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c05;
        end if;
        if new.fila < 06 then
            _denominador := cast(_clave[06] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c06
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c06;
        end if;
        if new.fila < 07 then
            _denominador := cast(_clave[07] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c07
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c07;
        end if;
        if new.fila < 08 then
            _denominador := cast(_clave[08] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c08
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c08;
        end if;
        if new.fila < 09 then
            _denominador := cast(_clave[09] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c09
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c09;
        end if;
        if new.fila < 10 then
            _denominador := cast(_clave[10] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c10
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c10;
        end if;
        if new.fila < 11 then
            _denominador := cast(_clave[11] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c11
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c11;
        end if;
        if new.fila < 12 then
            _denominador := cast(_clave[12] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c12
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c12;
        end if;
        if new.fila < 13 then
            _denominador := cast(_clave[13] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c13
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c13;
        end if;
        if new.fila < 14 then
            _denominador := cast(_clave[14] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c14
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c14;
        end if;
        if new.fila < 15 then
            _denominador := cast(_clave[15] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c15
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c15;
        end if;
        if new.fila < 16 then
            _denominador := cast(_clave[16] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c16
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c16;
        end if;
        if new.fila < 17 then
            _denominador := cast(_clave[17] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c17
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c17;
        end if;
        if new.fila < 18 then
            _denominador := cast(_clave[18] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c18
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c18;
        end if;
        if new.fila < 19 then
            _denominador := cast(_clave[19] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c19
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c19;
        end if;
        if new.fila < 20 then
            _denominador := cast(_clave[20] as bigint);
            update razon_nodo_indice
            set ordinal_razon = new.c20
            where razon_nodo_indice.nodo = new.nodo
            and razon_nodo_indice.numerador = new.id
            and razon_nodo_indice.denominador = _denominador
            and razon_nodo_indice.ordinal_razon <> new.c20;
        end if;
        return new;
    end if;
    if TG_OP = 'INSERT' then
        _msg := gettext('la vista %s no permite agregar filas');
        _msg := format(_msg, _vista);
        raise exception using message = _msg;
    end if;
    if TG_OP = 'DELETE' then
        _msg := gettext('la vista %s no permite eliminar filas');
        _msg := format(_msg, _vista);
        raise exception using message = _msg;
    end if;
    return null;
end;
$$ language plpgsql;

drop trigger if exists seudo_fila_matriz_razon_instead on seudo_fila_matriz_razon cascade;
create trigger seudo_fila_matriz_razon_instead instead of insert or update or delete on seudo_fila_matriz_razon
for each row execute procedure seudo_fila_matriz_razon_instead();
/*
select * from seudo_fila_matriz_razon;
*/
