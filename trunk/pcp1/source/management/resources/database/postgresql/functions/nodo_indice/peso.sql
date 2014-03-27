create or replace function nodo_indice$ae$razon_nodo_indice(_nodo$ bigint) returns bigint as $$
declare
    _record RECORD;
begin
    for _record in
        select denominador, sum(razon) as sum_razon
        from razon_nodo_indice
        where nodo = _nodo$
        group by denominador
        order by denominador
    loop
        update nodo_indice set suma = _record.sum_razon where id = _record.denominador;
    end loop;
    /**/
    update razon_nodo_indice
    set proporcion = razon_nodo_indice.razon/nodo_indice.suma
    from nodo_indice
    where razon_nodo_indice.nodo = _nodo$
    and razon_nodo_indice.denominador = nodo_indice.id
    and nodo_indice.suma <> 0;
    /**/
    for _record in
        select numerador, avg(proporcion) as avg_proporcion
        from razon_nodo_indice
        where nodo = _nodo$
        group by numerador
        order by numerador
    loop
        update nodo_indice set peso_a_h_p = _record.avg_proporcion*100 where id = _record.numerador;
    end loop;
    return _nodo$;
end;
$$ language plpgsql;
