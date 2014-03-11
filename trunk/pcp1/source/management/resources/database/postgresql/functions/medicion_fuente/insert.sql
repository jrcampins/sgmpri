create or replace function medicion_fuente$insert(_medicion_nodo$ bigint, _nodo$ bigint, _programador$ bigint, _fecha_programada$ date)
returns void as $$
declare
    _msg character varying;
    _enum_tipo_nodo RECORD;
    _sub nodo_indice%ROWTYPE;
    _id1 bigint;
    _id2 bigint;
    _codigo character varying;
begin
    raise notice 'medicion_fuente$insert(medicion=%, nodo=%, programador=%, fecha=%)', _medicion_nodo$, _nodo$, _programador$, _fecha_programada$;
    _enum_tipo_nodo := tipo_nodo$enum();
    for _sub in select * from nodo_indice where superior = _nodo$
    loop
        if _sub.tipo_nodo = _enum_tipo_nodo.HOJA then
            select id into _id1 from medicion_fuente
            where medicion = _medicion_nodo$ and fuente = _sub.fuente;
            if not found then
                _id1 := bigintid();
                select codigo into _codigo from fuente where id = _sub.fuente;
                if not found then
                    _msg := format(gettext('no existe %s con %s = %s'), 'fuente', 'id', _sub.fuente);
                    raise exception using message = _msg;
                end if;
                insert
                into medicion_fuente (id, codigo, medicion, fuente, programador, fecha_programada)
                values (_id1, _codigo||'-'||_medicion_nodo$, _medicion_nodo$, _sub.fuente, _programador$, _fecha_programada$);
                insert
                into medicion_variable (id, medicion, variable)
                values (bigintid(), _id1, _sub.variable);
            else
                select id into _id2 from medicion_variable
                where medicion = _id1 and variable = _sub.variable;
                if not found then
                    insert
                    into medicion_variable (id, medicion, variable)
                    values (bigintid(), _id1, _sub.variable);
                end if;
            end if;
        else
            perform medicion_fuente$insert(_medicion_nodo$, _sub.id, _programador$, _fecha_programada$);
        end if;
    end loop;
end;
$$ language plpgsql;
