create or replace function nodo_indice$insert$segmento(_id$ bigint, _codigo$ varchar, _nombre$ varchar, _superior$ bigint)
returns void as $$
begin
    perform nodo_indice$insert$conjunto_segmento(_id$, _codigo$, _nombre$);
    perform nodo_indice$insert$elemento_segmento(_id$, _codigo$, _nombre$, _id$);
    perform nodo_indice$insert$segmento_superior(_id$, _codigo$, _nombre$, _superior$);
end;
$$ language plpgsql;

create or replace function nodo_indice$insert$segmento_superior(_id$ bigint, _codigo$ varchar, _nombre$ varchar, _superior$ bigint)
returns void as $$
declare
    _msg varchar;
    _row nodo_indice%ROWTYPE;
begin
    if _superior$ is not null then
        select * into _row from nodo_indice where id = _superior$;
        if not found then
            _msg := format(gettext('no existe %s con %s = %s'), 'nodo', 'id', _superior$);
            raise exception using message = _msg;
        end if;
        perform nodo_indice$insert$conjunto_segmento(_row.id, _row.codigo, _row.nombre);
        perform nodo_indice$insert$elemento_segmento(_id$, _codigo$, _nombre$, _superior$);
        perform nodo_indice$insert$segmento_superior(_id$, _codigo$, _nombre$, _row.superior);
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$select$clase_recurso_segmento() returns bigint as $$
declare
    _msg varchar;
    _codigo_clase varchar := 'nodo_indice';
    _id_clase_recurso bigint;
begin
    select id_clase_recurso into _id_clase_recurso from clase_recurso where codigo_clase_recurso = _codigo_clase;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'clase', 'codigo', _codigo_clase);
        raise exception using message = _msg;
    end if;
    return _id_clase_recurso;
end;
$$ language plpgsql;

create or replace function nodo_indice$insert$conjunto_segmento(_id$ bigint, _codigo$ varchar, _nombre$ varchar)
returns void as $$
declare
    _msg varchar;
    _codigo_clase varchar := 'nodo_indice';
    _codigo_conjunto varchar;
    _id_clase_recurso bigint;
    _row conjunto_segmento%ROWTYPE;
begin
    _codigo_conjunto := _codigo$||'/'||_codigo_clase||'_'||_id$;
    _id_clase_recurso := nodo_indice$select$clase_recurso_segmento();
    select * into _row from conjunto_segmento where id_conjunto_segmento = _id$;
    if found then
        if _row.id_clase_recurso <> _id_clase_recurso then
            _msg := format(gettext('%s con %s = %s no tiene %s = %s'), 'conjunto', 'id', _id$, 'clase', _codigo_clase);
            raise exception using message = _msg;
        end if;
        if _row.codigo_conjunto_segmento <> _codigo_conjunto or _row.nombre_conjunto_segmento <> _nombre$ then
            update conjunto_segmento
            set codigo_conjunto_segmento = _codigo_conjunto, nombre_conjunto_segmento = _nombre$
            where id_conjunto_segmento = _id$;
        end if;
    else
        insert into conjunto_segmento (
            id_conjunto_segmento,
            codigo_conjunto_segmento,
            nombre_conjunto_segmento,
            id_clase_recurso
        ) values (
            _id$,
            _codigo_conjunto,
            _nombre$,
            _id_clase_recurso
        );
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$insert$elemento_segmento(_id$ bigint, _codigo$ varchar, _nombre$ varchar, _conjunto$ bigint)
returns void as $$
declare
    _row elemento_segmento%ROWTYPE;
begin
    select * into _row from elemento_segmento where id_conjunto_segmento = _conjunto$ and segmento_entero_grande = _id$ and id_segmento = _id$;
    if found then
        if _row.codigo_segmento <> _codigo$ or _row.nombre_segmento <> _nombre$ then
            update elemento_segmento
            set codigo_segmento = _codigo$, nombre_segmento = _nombre$
            where id_elemento_segmento = _row.id_elemento_segmento;
        end if;
    else
        insert into elemento_segmento (
            id_elemento_segmento,
            segmento_entero_grande,
            id_segmento,
            codigo_segmento,
            nombre_segmento,
            id_conjunto_segmento
        ) values (
            bigintid(),
            _id$,
            _id$,
            _codigo$,
            _nombre$,
            _conjunto$
        );
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$delete$elemento_segmento(_id$ bigint) returns void as $$
declare
    _id_clase_recurso bigint;
begin
    _id_clase_recurso := nodo_indice$select$clase_recurso_segmento();
    delete from elemento_segmento
    where id_conjunto_segmento in (
        select id_conjunto_segmento
        from conjunto_segmento
        where id_clase_recurso = _id_clase_recurso
    )
    and segmento_entero_grande = _id$
    and id_segmento = _id$;
end;
$$ language plpgsql;
