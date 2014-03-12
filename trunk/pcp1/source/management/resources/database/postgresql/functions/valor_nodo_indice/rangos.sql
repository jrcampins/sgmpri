create or replace function valor_nodo_indice$rangos(_nodo$ bigint, _peso$ numeric) returns SETOF RECORD as $$
declare
    _enum_tipo_nodo RECORD;
    _vnx RECORD;
    _pns numeric; -- peso nodo superior
    _pnx numeric; -- peso nodo
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    _pns := coalesce(_peso$, 1);
    for _vnx in
        select
            vnx.id as nodo,
            nx.codigo as codigo_nodo,
            vnx.tipo_nodo,
            nx.peso/100 as peso,
            vnx.numeral_rango as rango,
            vx.codigo as codigo_variable,
            vx.rango_minimo_x2 as rango_minimo,
            vx.rango_maximo_x2 as rango_maximo
        from valor_nodo_indice vnx
        inner join nodo_indice nx on nx.id=vnx.nodo
        left outer join variable vx on vx.id=nx.variable
        where vnx.superior = _nodo$
        order by nx.codigo
    loop
        _pnx := _pns * coalesce(_vnx.peso, 1);
        if _vnx.tipo_nodo = _enum_tipo_nodo.HOJA then
            return query
            select
                _vnx.nodo,
                _vnx.codigo_nodo,
                _vnx.codigo_variable,
                _pnx,
                _vnx.rango,
                _vnx.rango_minimo,
                _vnx.rango_maximo;
        else
            return query
            select *
            from valor_nodo_indice$rangos(_vnx.nodo, _pnx)
            as rangos (
                nodo bigint,
                codigo_nodo varchar,
                codigo_variable varchar,
                peso numeric,
                rango integer,
                rango_minimo integer,
                rango_maximo integer
                )
            order by codigo_nodo;
        end if;
    end loop;
end;
$$ language plpgsql;
