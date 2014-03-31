create or replace function razon_nodo_indice$crosstab(_nodo$ bigint) returns SETOF RECORD as $$
declare
    _s character varying;
    _n integer;
    _r RECORD;
    _c integer[]; -- := '{}';
begin
    select string_agg(codigo, E'\n' order by codigo), count(*) into _s, _n from nodo_indice where superior = _nodo$;
    for _r in
        select *, row_number()over(order by codigo)::integer as fila from nodo_indice where superior = _nodo$ order by codigo
    loop
        select array_agg(ordinal_razon order by codigo)
        into _c
        from razon_nodo_indice
        inner join nodo_indice on nodo_indice.id = razon_nodo_indice.denominador
        where nodo = _nodo$
        and numerador = _r.id;
        return query
            select _r.id, _r.version, _r.codigo, _r.superior, _r.fila, _n,
                _c[01], _c[02], _c[03], _c[04], _c[05], _c[06], _c[07], _c[08], _c[09], _c[10],
                _c[11], _c[12], _c[13], _c[14], _c[15], _c[16], _c[17], _c[18], _c[19], _c[20],
                _s;
    end loop;
end;
$$ language plpgsql;
-- /*
select * from razon_nodo_indice$crosstab(1010100)
as fila_matriz_razon (id bigint, version bigint, codigo character varying, nodo bigint, fila integer, dimension integer,
c01 integer, c02 integer, c03 integer, c04 integer, c05 integer, c06 integer, c07 integer, c08 integer, c09 integer, c10 integer,
c11 integer, c12 integer, c13 integer, c14 integer, c15 integer, c16 integer, c17 integer, c18 integer, c19 integer, c20 integer,
etiquetas character varying)
order by nodo, codigo;
-- */
