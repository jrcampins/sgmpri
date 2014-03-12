create or replace function valor_nodo_indice$insert(_medicion_nodo$ bigint, _nodo$ bigint, _superior$ bigint, _fecha_valor$ date)
returns void as $$
declare
    _enum_tipo_nodo RECORD;
    _id bigint;
    _tipo_nodo integer;
    _sub nodo_indice%ROWTYPE;
    _msg character varying;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    _id := bigintid();
    if _superior$ is null then
        _tipo_nodo := _enum_tipo_nodo.RAIZ;
    else
        select tipo_nodo into _tipo_nodo from nodo_indice where id = _nodo$;
        if not found then
            _msg := format(gettext('no existe %s con %s = %s'), 'nodo', 'id', _nodo$);
            raise exception using message = _msg;
        end if;
    end if;
    insert
    into valor_nodo_indice (id, medicion, nodo, tipo_nodo, superior, fecha_valor)
    values (_id, _medicion_nodo$, _nodo$, _tipo_nodo, _superior$, _fecha_valor$);
    for _sub in select * from nodo_indice where superior = _nodo$
    loop
        perform valor_nodo_indice$insert(_medicion_nodo$, _sub.id, _id, _fecha_valor$);
    end loop;
end;
$$ language plpgsql;
