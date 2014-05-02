create or replace function valor_nodo_indice$insert(_medicion_nodo$ bigint, _nodo$ bigint, _superior$ bigint, _fecha_valor$ date)
returns void as $$
declare
    _enum_tipo_nodo RECORD;
    _enum_tipo_peso_nodo RECORD;
    _id bigint;
    _tipo_nodo integer;
    _peso numeric(7,4);
    _sub nodo_indice%ROWTYPE;
    _msg character varying;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    _enum_tipo_peso_nodo := tipo_peso_nodo$enum();
    _id := bigintid();
    if _superior$ is null then
        _tipo_nodo := _enum_tipo_nodo.RAIZ;
    else
        select
            tipo_nodo,
            case tipo_peso_nodo
                when _enum_tipo_peso_nodo.ASIGNACION_DIRECTA    then peso_asignado
                when _enum_tipo_peso_nodo.METODO_AHP            then peso_a_h_p
                when _enum_tipo_peso_nodo.METODO_SIMPLIFICADO   then peso_simplificado
                else null
            end as peso
        into _tipo_nodo, _peso
        from nodo_indice
        where id = _nodo$;
        if not found then
            _msg := format(gettext('no existe %s con %s = %s'), 'nodo', 'id', _nodo$);
            raise exception using message = _msg;
        end if;
    end if;
    insert
    into valor_nodo_indice (id, medicion, nodo, tipo_nodo, superior, peso, fecha_valor)
    values (_id, _medicion_nodo$, _nodo$, _tipo_nodo, _superior$, _peso, _fecha_valor$);
    for _sub in select * from nodo_indice where superior = _nodo$
    loop
        perform valor_nodo_indice$insert(_medicion_nodo$, _sub.id, _id, _fecha_valor$);
    end loop;
end;
$$ language plpgsql;
