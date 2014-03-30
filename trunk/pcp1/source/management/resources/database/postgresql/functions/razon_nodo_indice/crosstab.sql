create or replace function razon_nodo_indice$crosstab(_nodo$ bigint) returns SETOF RECORD as $$
declare
    _r RECORD;
    _i integer;
    _o integer;
    _v integer[] := '{}';
begin
    for _r in
        select numerador as id, 0::bigint as version, nodo_indice.codigo, count(*)::integer as dimension
        from razon_nodo_indice
        inner join nodo_indice on nodo_indice.id = razon_nodo_indice.numerador
        where nodo = _nodo$
        group by numerador, nodo_indice.codigo
        order by nodo_indice.codigo
    loop
        _i := 0;
        for _o in
            select ordinal_razon
            from razon_nodo_indice
            inner join nodo_indice on nodo_indice.id = razon_nodo_indice.denominador
            where nodo = _nodo$
            and numerador = _r.id
            order by nodo_indice.codigo
        loop
            _i := _i + 1;
            _v[_i] := _o;
        end loop;
        return query
            select _r.id, _r.version, _r.codigo, _nodo$, _r.dimension,
                _v[01], _v[02], _v[03], _v[04], _v[05], _v[06], _v[07], _v[08], _v[09], _v[10],
                _v[11], _v[12], _v[13], _v[14], _v[15], _v[16], _v[17], _v[18], _v[19], _v[20];
    end loop;
end;
$$ language plpgsql;
/*
select * from razon_nodo_indice$crosstab(1010100)
as fila_matriz_razon (id bigint, version bigint, codigo character varying, nodo bigint, dimension integer,
c01 integer, c02 integer, c03 integer, c04 integer, c05 integer, c06 integer, c07 integer, c08 integer, c09 integer, c10 integer,
c11 integer, c12 integer, c13 integer, c14 integer, c15 integer, c16 integer, c17 integer, c18 integer, c19 integer, c20 integer)
order by nodo, codigo;
*/
