create or replace function nodo_indice$actualizar_tipo_peso$biz(_super$ bigint, _nodo$ bigint, _tipo_peso_nodo$ integer) returns integer as $$
declare
    _msg character varying;
    _row nodo_indice%ROWTYPE;
    _rowcount integer := 1;
begin
    raise notice 'nodo_indice$actualizar_tipo_peso$biz(%, %, %)', _super$, _nodo$, _tipo_peso_nodo$;
    update nodo_indice set tipo_peso_nodo = _tipo_peso_nodo$ where id = _nodo$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'nodo de índice', 'id', _nodo$);
        raise exception using message = _msg;
    end if;
    for _row in select * from nodo_indice where superior = _nodo$ order by codigo
    loop
        _rowcount := _rowcount + nodo_indice$actualizar_tipo_peso$biz(_super$, _row.id, _tipo_peso_nodo$);
    end loop;
    return _rowcount;
    return 0;
end;
$$ language plpgsql;
