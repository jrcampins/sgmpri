create or replace function valor_nodo_indice$respuestas(_nodo$ bigint) returns SETOF RECORD as $$
declare
    _enum_tipo_nodo RECORD;
    _vnx RECORD;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    for _vnx in
        select
            vni.id as elemento,
            vni.tipo_nodo,
            vni.superior as componente,
            vni.rango,
            ni1.codigo as codigo_elemento,
            ni1.nombre as nombre_elemento,
            ni2.codigo as codigo_componente,
            ni2.nombre as nombre_componente
        from valor_nodo_indice vni
        inner join nodo_indice ni1 on ni1.id=vni.nodo
        inner join nodo_indice ni2 on ni2.id=ni1.superior
        where vni.superior = _nodo$
        order by 1
    loop
        if _vnx.tipo_nodo = _enum_tipo_nodo.HOJA then
            return query
            select
                _vnx.componente,
                _vnx.codigo_componente,
                _vnx.nombre_componente,
                _vnx.elemento,
                _vnx.codigo_elemento,
                _vnx.nombre_elemento,
                _vnx.rango;
        else
            return query
            select *
            from valor_nodo_indice$respuestas(_vnx.elemento)
            as respuestas (
                componente bigint,
                codigo_componente character varying(30),
                nombre_componente character varying(100),
                elemento bigint,
                codigo_elemento character varying(30),
                nombre_elemento character varying(100),
                rango character varying(20)
                )
            order by codigo_componente, codigo_elemento;
        end if;
    end loop;
end;
$$ language plpgsql;
