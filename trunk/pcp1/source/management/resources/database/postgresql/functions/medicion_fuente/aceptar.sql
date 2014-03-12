create or replace function medicion_fuente$aceptar$biz(_super$ bigint, _medicion$ bigint, _observaciones$ character varying) returns integer as $$
declare
    _msg character varying;
    _log rastro_proceso%ROWTYPE;
    _enum_condicion_medicion_fuente RECORD;
    _row medicion_fuente%ROWTYPE;
begin
    raise notice 'medicion_fuente$aceptar$biz(%, %, %)', _super$, _medicion$, _observaciones$;
    select * into _log from rastro_proceso_temporal;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'rastro de proceso temporal', 'id', pg_backend_pid());
        raise exception using message = _msg;
    end if;
    _enum_condicion_medicion_fuente := condicion_medicion_fuente$enum();
    select * into _row from medicion_fuente where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por fuente', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    update medicion_fuente
    set observaciones = _observaciones$,
        verificador = _log.id_usuario,
        fecha_verificacion = current_date,
        condicion = _enum_condicion_medicion_fuente.ACEPTADA,
        fecha_condicion = current_date
    where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por fuente', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    update valor_nodo_indice vnx
    set rango = rv.nombre, numeral_rango = rv.numero
    from nodo_indice nx, medicion_fuente mf, medicion_variable mv, rango_variable rv
    where vnx.medicion = _row.medicion
    and nx.id = vnx.nodo and nx.fuente = _row.fuente
    and mf.medicion = vnx.medicion and mf.fuente = nx.fuente
    and mv.medicion = mf.id and mv.variable = nx.variable
    and rv.id = mv.rango;
    perform medicion_nodo$calcular(_row.medicion);
    return 0;
end;
$$ language plpgsql;
