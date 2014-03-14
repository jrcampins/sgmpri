create or replace function medicion_rama$registrar$biz(_super$ bigint, _medicion$ bigint) returns integer as $$
declare
    _msg character varying;
    _log rastro_proceso%ROWTYPE;
    _enum_condicion_medicion_rama RECORD;
    _row medicion_rama%ROWTYPE;
begin
    raise notice 'medicion_rama$registrar$biz(%, %)', _super$, _medicion$;
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
    set registrador = _log.id_usuario,
        fecha_registro = current_date,
        condicion = _enum_condicion_medicion_rama.REGISTRADA,
        fecha_condicion = current_date
    where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por rama', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    perform medicion_nodo$empezar$biz(null, _row.medicion);
    return 0;
end;
$$ language plpgsql;
