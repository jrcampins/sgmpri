create or replace function medicion_rama$insert(_medicion_nodo$ bigint, _nodo$ bigint)
returns void as $$
declare
    _msg character varying;
    _enum_tipo_nodo RECORD;
    _sub nodo_indice%ROWTYPE;
    _id1 bigint;
    _id2 bigint;
    _codigo character varying;
    _nombre character varying;
begin
    raise notice 'medicion_rama$insert(medicion=%, nodo=%)', _medicion_nodo$, _nodo$;
    _enum_tipo_nodo := tipo_nodo$enum();
    for _sub in select * from nodo_indice where superior = _nodo$
    loop
        if _sub.tipo_nodo = _enum_tipo_nodo.HOJA then
            select id into _id1 from medicion_rama where medicion = _medicion_nodo$ and rama = _nodo$;
            if not found then
                _id1 := bigintid();
                select codigo, nombre into _codigo, _nombre from nodo_indice where id = _nodo$;
                if not found then
                    _msg := format(gettext('no existe %s con %s = %s'), 'rama', 'id', _nodo$);
                    raise exception using message = _msg;
                end if;
                insert
                into medicion_rama (id, codigo, nombre, medicion, rama)
                values (_id1, _codigo||'-'||_medicion_nodo$, _nombre, _medicion_nodo$, _nodo$);
                insert
                into medicion_variable (id, medicion, hoja, variable)
                values (bigintid(), _id1, _sub.id, _sub.variable);
            else
                select id into _id2 from medicion_variable where medicion = _id1 and hoja = _sub.id;
                if not found then
                    insert
                    into medicion_variable (id, medicion, hoja, variable)
                    values (bigintid(), _id1, _sub.id, _sub.variable);
                end if;
            end if;
        else
            perform medicion_rama$insert(_medicion_nodo$, _sub.id);
        end if;
    end loop;
end;
$$ language plpgsql;
