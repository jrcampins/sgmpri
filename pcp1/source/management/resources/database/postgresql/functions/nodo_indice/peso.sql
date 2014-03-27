create or replace function nodo_indice$update$peso_ahp(_nodo$ bigint) returns void as $$
declare
    _record RECORD;
begin
    update razon_nodo_indice set proporcion = null where nodo = _nodo$;
    for _record in
        select denominador, sum(razon) as sum_razon
        from razon_nodo_indice
        where nodo = _nodo$
        group by denominador
        order by denominador
    loop
        if _record.sum_razon is not null and _record.sum_razon > 0 then
            update razon_nodo_indice
            set proporcion = razon/_record.sum_razon
            where nodo = _nodo$
            and denominador = _record.denominador;
        end if;
    end loop;
    /**/
    update nodo_indice set peso_a_h_p = null where superior = _nodo$;
    for _record in
        select numerador, avg(proporcion) as avg_proporcion
        from razon_nodo_indice
        where nodo = _nodo$
        group by numerador
        order by numerador
    loop
        update nodo_indice set peso_a_h_p = _record.avg_proporcion*100 where id = _record.numerador;
    end loop;
end;
$$ language plpgsql;

create or replace function nodo_indice$update$peso_simplificado(_nodo$ bigint) returns void as $$
declare
    _sum_impacto numeric;
begin
    select sum(impacto) into _sum_impacto from nodo_indice where superior = _nodo$;
    if _sum_impacto is not null and _sum_impacto > 0 then
        update nodo_indice set peso_simplificado = 100*impacto/_sum_impacto where superior = _nodo$;
    else
        update nodo_indice set peso_simplificado = null where superior = _nodo$;
    end if;
end;
$$ language plpgsql;
