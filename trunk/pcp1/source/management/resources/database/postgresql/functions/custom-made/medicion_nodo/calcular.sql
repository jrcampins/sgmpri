create or replace function medicion_nodo$calcular(_medicion$ bigint) returns integer as $$
declare
    _int integer := 0;
    _msg character varying;
    _row medicion_nodo%ROWTYPE;
    _vni valor_nodo_indice%ROWTYPE;
begin
    raise notice 'medicion_nodo$calcular(medicion=%)', _medicion$;
    select * into _row from medicion_nodo where id = _medicion$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'medición por nodo', 'id', _medicion$);
        raise exception using message = _msg;
    end if;
    select * into _vni from valor_nodo_indice where medicion = _row.id and nodo = _row.nodo;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'valor nodo índice', 'medicion', _medicion$);
        raise exception using message = _msg;
    end if;
    _int := valor_nodo_indice$calcular(_vni.id, true);
    if _int = 0 then
        perform medicion_nodo$terminar$biz(null, _medicion$);
    end if;
    return _int;
end;
$$ language plpgsql;
