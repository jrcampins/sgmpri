create or replace function medicion_rama$rechazar$biz(_super$ bigint, _medicion$ bigint, _observaciones$ character varying) returns integer as $$
declare
    _msg character varying;
    _log rastro_proceso%ROWTYPE;
    _enum_condicion_medicion_rama RECORD;
begin
    raise notice 'medicion_rama$rechazar$biz(%, %, %)', _super$, _medicion$, _observaciones$;
    select * into _log from rastro_proceso_temporal;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'rastro de proceso temporal', 'id', pg_backend_pid());
        raise exception using message = _msg;
    end if;
    _enum_condicion_medicion_rama := condicion_medicion_rama$enum();
    update medicion_rama
    set observaciones = coalesce(observaciones||E'\n'||_observaciones$, _observaciones$),
        verificador = _log.id_usuario,
        fecha_verificacion = current_date,
        condicion = _enum_condicion_medicion_rama.RECHAZADA,
        fecha_condicion = current_date
    where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por rama', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    return 0;
end;
$$ language plpgsql;
