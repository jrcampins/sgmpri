/*
create or replace function nodo_indice$rangos(_nodo$ bigint) returns SETOF RECORD as $$
declare
    _enum_tipo_nodo RECORD;
    _r RECORD;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    for _r in
        select
            n.id as nodo,
            n.codigo as codigo_nodo,
            n.tipo_nodo,
            n.peso,
            v.id as variable,
            v.codigo as codigo_variable,
            v.rango_minimo_x2 as rango_minimo,
            v.rango_maximo_x2 as rango_maximo
        from nodo_indice n
        left outer join variable v on v.id = n.variable
        where n.superior = _nodo$
        order by n.codigo
    loop
        if _r.tipo_nodo = _enum_tipo_nodo.HOJA then
            return query
            select
                _r.nodo,
                _r.codigo_nodo,
                _r.variable,
                _r.codigo_variable,
                _r.peso,
                _r.rango_minimo,
                _r.rango_maximo;
        else
            return query
            select *
            from nodo_indice$rangos(_r.nodo)
            as rangos (
                nodo bigint,
                codigo_nodo varchar,
                variable bigint,
                codigo_variable varchar,
                peso numeric(7,4),
                rango_minimo integer,
                rango_maximo integer
                )
            order by codigo_nodo;
        end if;
    end loop;
end;
$$ language plpgsql;
*/
