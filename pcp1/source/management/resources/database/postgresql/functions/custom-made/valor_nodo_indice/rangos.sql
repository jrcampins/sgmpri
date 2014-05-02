create or replace function valor_nodo_indice$rangos(_nodo$ bigint, _peso$ numeric) returns SETOF RECORD as $$
declare
    _enum_tipo_nodo RECORD;
    _enum_tipo_peso_nodo RECORD;
    _vnx RECORD;
    _pns numeric; -- peso nodo superior
    _pnx numeric; -- peso nodo
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    _enum_tipo_peso_nodo := tipo_peso_nodo$enum();
    _pns := coalesce(_peso$, 1);
    for _vnx in
        select
            vnx.id as nodo,
            vnx.tipo_nodo,
            case nx.tipo_peso_nodo
                when _enum_tipo_peso_nodo.ASIGNACION_DIRECTA    then nx.peso_asignado
                when _enum_tipo_peso_nodo.METODO_AHP            then nx.peso_a_h_p
                when _enum_tipo_peso_nodo.METODO_SIMPLIFICADO   then nx.peso_simplificado
                else null
            end as peso,
            vnx.numeral_rango as rango,
            vx.rango_minimo as rango_minimo,
            vx.rango_maximo as rango_maximo
        from valor_nodo_indice vnx
        inner join nodo_indice nx on nx.id=vnx.nodo
        left outer join variable vx on vx.id=nx.variable
        where vnx.superior = _nodo$
        order by 1
    loop
        _pnx := _pns * coalesce(_vnx.peso/100, 1);
        if _vnx.tipo_nodo = _enum_tipo_nodo.HOJA then
            return query
            select
                _vnx.nodo,
                _pnx as peso,
                _vnx.rango,
                _vnx.rango_minimo,
                _vnx.rango_maximo;
        else
            return query
            select *
            from valor_nodo_indice$rangos(_vnx.nodo, _pnx)
            as rangos (
                nodo bigint,
                peso numeric,
                rango integer,
                rango_minimo integer,
                rango_maximo integer
                )
            order by 1;
        end if;
    end loop;
end;
$$ language plpgsql;
