create or replace function nodo_indice$update$peso_ahp(_nodo$ bigint) returns void as $$
declare
    _record RECORD;
begin
    update razon_nodo_indice set proporcion = null where nodo = _nodo$;
    for _record in
        select denominador, sum(razon) as sum_razon
        from razon_nodo_indice
        where nodo = _nodo$
        group by denominador
        order by denominador
    loop
        if _record.sum_razon is not null and _record.sum_razon > 0 then
            update razon_nodo_indice
            set proporcion = 100*razon/_record.sum_razon
            where nodo = _nodo$
            and denominador = _record.denominador;
        end if;
    end loop;
    /**/
    update nodo_indice set peso_a_h_p = null where superior = _nodo$;
    for _record in
        select numerador, avg(proporcion) as avg_proporcion
        from razon_nodo_indice
        where nodo = _nodo$
        group by numerador
        order by numerador
    loop
        update nodo_indice set peso_a_h_p = _record.avg_proporcion where id = _record.numerador;
    end loop;
end;
$$ language plpgsql;

create or replace function nodo_indice$update$peso_simplificado(_nodo$ bigint) returns void as $$
declare
    _sum_impacto numeric;
begin
    select sum(impacto) into _sum_impacto from nodo_indice where superior = _nodo$;
    if _sum_impacto is not null and _sum_impacto > 0 then
        update nodo_indice set peso_simplificado = 100*impacto/_sum_impacto where superior = _nodo$;
    else
        update nodo_indice set peso_simplificado = null where superior = _nodo$;
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$verify$peso_asignado(_nodo$ bigint) returns void as $$
declare
    _sum_peso_asignado numeric;
begin
    select sum(peso_asignado) into _sum_peso_asignado from nodo_indice where superior = _nodo$;
    if _sum_peso_asignado is null or _sum_peso_asignado < 99.99 or _sum_peso_asignado > 100.01 then
        perform nodo_indice$raise$sumpaneq100(_nodo$);
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$raise$sumpaneq100(_nodo$ bigint)
returns void as $$
declare
    _enum_tipo_peso_nodo RECORD;
    _tpn integer;
    _s01 character varying;
    _s02 character varying;
    _msg character varying;
begin
    _enum_tipo_peso_nodo := tipo_peso_nodo$enum();
    select tipo_peso_nodo, codigo, nombre into _tpn, _s01 from nodo_indice where id = _nodo$;
    _msg := gettext('la suma de pesos asignados del nodo %s es menor que %s o mayor que %s');
    _msg := format(_msg, _s01, 99.99, 100.01);
    if _tpn = _enum_tipo_peso_nodo.ASIGNACION_DIRECTA then
        raise exception using message = _msg;
    else
        raise warning using message = _msg;
        update rastro_proceso_temporal set descripcion_error = coalesce(descripcion_error||';'||E'\n'||_msg, _msg);
    end if;
end;
$$ language plpgsql;
