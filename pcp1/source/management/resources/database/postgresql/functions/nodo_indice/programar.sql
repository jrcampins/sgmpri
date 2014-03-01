create or replace function nodo_indice$programar$biz(_super$ bigint, _nodo$ bigint) returns integer as $$
declare
    _msg character varying;
    _log rastro_proceso%ROWTYPE;
begin
    raise notice 'nodo_indice$programar$biz(%, %)', _super$, _nodo$;
    select * into _log from rastro_proceso_temporal;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'rastro de proceso temporal', 'id', pg_backend_pid());
        raise exception using message = _msg;
    end if;
    perform nodo_indice$programar$biz$sub(_nodo$, _super$, _log.id_usuario, current_date);
    return 0;
end;
$$ language plpgsql;

create or replace function nodo_indice$programar$biz$sub(_nodo$ bigint, _lote$ bigint, _programador$ bigint, _fecha$ date)
returns void as $$
declare
    _msg character varying;
    _enum_tipo_nodo RECORD;
    _sub nodo_indice%ROWTYPE;
    _id1 bigint;
    _id2 bigint;
    _codigo character varying;
begin
    raise notice 'nodo_indice$programar$biz$sub(nodo=%, lote=%, programador=%, fecha=%)', _nodo$, _lote$, _programador$, _fecha$;
    _enum_tipo_nodo := tipo_nodo$enum();
    for _sub in select * from nodo_indice where superior = _nodo$
    loop
        if _sub.tipo_nodo = _enum_tipo_nodo.HOJA then
            select id into _id1 from medicion
            where version = _lote$ and fuente = _sub.fuente and programador = _programador$ and fecha_programada = _fecha$;
            if not found then
                _id1 := bigintid();
                select codigo into _codigo from fuente where id = _sub.fuente;
                if not found then
                    _msg := format(gettext('no existe %s con %s = %s'), 'fuente', 'id', _sub.fuente);
                    raise exception using message = _msg;
                end if;
                insert
                into medicion (id, version, fuente, programador, fecha_programada, codigo)
                values (_id1, _lote$, _sub.fuente, _programador$, _fecha$, _lote$||'-'||_codigo);
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
            perform nodo_indice$programar$biz$sub(_sub.id, _lote$, _programador$, _fecha$);
        end if;
    end loop;
end;
$$ language plpgsql;
