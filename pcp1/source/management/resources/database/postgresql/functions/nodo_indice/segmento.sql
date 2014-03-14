create or replace function nodo_indice$insert$segmento(_id$ bigint, _codigo$ varchar, _nombre$ varchar, _superior$ bigint)
returns void as $$
declare
    _msg varchar;
    _clase varchar := 'nodo_indice';
    _conjunto varchar;
    _id_clase_recurso bigint;
    _row_cs conjunto_segmento%ROWTYPE;
begin
    select id_clase_recurso into _id_clase_recurso from clase_recurso where codigo_clase_recurso = _clase;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'clase', 'codigo', _clase);
        raise exception using message = _msg;
    end if;
    _conjunto := _codigo$||'/'||_clase||'_'||_id$;
    select * into _row_cs from conjunto_segmento where id_conjunto_segmento = _id$;
    if found then
        if _row_cs.id_clase_recurso <> _id_clase_recurso then
            _msg := format(gettext('%s con %s = %s no tiene %s = %s'), 'conjunto', 'id', _id$, 'clase', _clase);
            raise exception using message = _msg;
        end if;
        if _row_cs.codigo_conjunto_segmento <> _conjunto or _row_cs.nombre_conjunto_segmento <> _nombre$ then
            update conjunto_segmento
            set codigo_conjunto_segmento = _conjunto, nombre_conjunto_segmento = _nombre$
            where id=_id$;
        end if;
    else
        insert into conjunto_segmento (
            id_conjunto_segmento,
            codigo_conjunto_segmento,
            nombre_conjunto_segmento,
            id_clase_recurso
        ) values (
            _id$,
            _conjunto,
            _nombre$,
            _id_clase_recurso
        );
    end if;
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
        _id$
    );
    if _superior$ is not null then
        perform nodo_indice$insert$segmento(_id$, _codigo$, _nombre$, _superior$, _id_clase_recurso);
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$insert$segmento(_id$ bigint, _codigo$ varchar, _nombre$ varchar, _superior$ bigint, _id_clase_recurso$ bigint)
returns void as $$
declare
    _msg varchar;
    _row_nx nodo_indice%ROWTYPE;
    _row_cs conjunto_segmento%ROWTYPE;
begin
    select * into _row_nx from nodo_indice where id=_superior$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'nodo', 'id', _superior$);
        raise exception using message = _msg;
    end if;
    select * into _row_cs from conjunto_segmento where id_conjunto_segmento = _superior$;
    if found then
        if _row_cs.id_clase_recurso <> _id_clase_recurso$ then
            _msg := format(gettext('%s con %s = %s no tiene %s = %s'), 'conjunto', 'id', _id$, 'clase', _clase);
            raise exception using message = _msg;
        end if;
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
            _superior$
        );
    end if;
    if _row_nx.superior is not null then
        perform nodo_indice$insert$segmento(_id$, _codigo$, _nombre$, _row_nx.superior, _id_clase_recurso$);
    end if;
end;
$$ language plpgsql;
