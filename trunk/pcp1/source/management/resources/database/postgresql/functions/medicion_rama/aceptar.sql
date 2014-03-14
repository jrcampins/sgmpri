create or replace function medicion_rama$aceptar$biz(_super$ bigint, _medicion$ bigint, _observaciones$ character varying) returns integer as $$
declare
    _msg character varying;
    _log rastro_proceso%ROWTYPE;
    _enum_condicion_medicion_rama RECORD;
    _row medicion_rama%ROWTYPE;
begin
    raise notice 'medicion_rama$aceptar$biz(%, %, %)', _super$, _medicion$, _observaciones$;
    select * into _log from rastro_proceso_temporal;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'rastro de proceso temporal', 'id', pg_backend_pid());
        raise exception using message = _msg;
    end if;
    _enum_condicion_medicion_rama := condicion_medicion_rama$enum();
    select * into _row from medicion_rama where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por rama', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    update medicion_rama
    set observaciones = _observaciones$,
        verificador = _log.id_usuario,
        fecha_verificacion = current_date,
        condicion = _enum_condicion_medicion_rama.ACEPTADA,
        fecha_condicion = current_date
    where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por rama', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    update valor_nodo_indice vnx
    set rango = rv.nombre, numeral_rango = rv.numero
    from medicion_variable mv, rango_variable rv
    where vnx.medicion = _row.medicion
    and mv.medicion = _medicion$
    and vnx.nodo = mv.hoja
    and rv.id = mv.rango;
    perform medicion_nodo$calcular(_row.medicion);
    return 0;
end;
$$ language plpgsql;
