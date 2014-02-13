create or replace function nodo_indice$$$color_nodo_indice(_nodo$ bigint)
returns boolean as $$
declare
    _enum_tipo_nodo RECORD;
    _row RECORD;
    _msg character varying;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    select nodo_indice.codigo, nodo_indice.tipo_nodo, tipo_nodo.codigo_tipo_nodo
    into _row
    from nodo_indice
    inner join tipo_nodo
    on tipo_nodo.numero_tipo_nodo = nodo_indice.tipo_nodo
    where nodo_indice.id = _nodo$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'nodo de indice', 'id', _nodo$);
        raise exception using message = _msg;
    end if;
    if _row.tipo_nodo = _enum_tipo_nodo.HOJA then
        _msg := format(gettext('no se permite agregar colores al nodo %s porque es de tipo %s'), _row.codigo, _row.codigo_tipo_nodo);
        raise exception using message = _msg;
    end if;
    return true;
end;
$$ language plpgsql;

create or replace function nodo_indice$$$razon_nodo_indice(_nodo$ bigint)
returns boolean as $$
declare
    _enum_tipo_nodo RECORD;
    _row RECORD;
    _msg character varying;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    select nodo_indice.codigo, nodo_indice.tipo_nodo, tipo_nodo.codigo_tipo_nodo
    into _row
    from nodo_indice
    inner join tipo_nodo
    on tipo_nodo.numero_tipo_nodo = nodo_indice.tipo_nodo
    where nodo_indice.id = _nodo$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'nodo de indice', 'id', _nodo$);
        raise exception using message = _msg;
    end if;
    if _row.tipo_nodo = _enum_tipo_nodo.HOJA then
        _msg := format(gettext('no se permite agregar razones al nodo %s porque es de tipo %s'), _row.codigo, _row.codigo_tipo_nodo);
        raise exception using message = _msg;
    end if;
    return true;
end;
$$ language plpgsql;