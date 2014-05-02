create or replace function nodo_indice$insert$razones(_nodo$ bigint) returns void as $$
declare
    _row nodo_indice%ROWTYPE;
    _col nodo_indice%ROWTYPE;
    _id bigint;
    _editable boolean;
begin
    if _nodo$ is not null then
        for _row in select * from nodo_indice where superior = _nodo$ order by codigo
        loop
            for _col in select * from nodo_indice where superior = _nodo$ order by codigo
            loop
                select id into _id from razon_nodo_indice where nodo = _nodo$ and numerador = _row.id and denominador = _col.id;
                if not found then
                    _editable := _row.codigo < _col.codigo;
                    insert
                    into razon_nodo_indice (id, nodo, numerador, denominador, editable)
                    values (bigintid(), _nodo$, _row.id, _col.id, _editable);
                end if;
            end loop;
        end loop;
        perform nodo_indice$update$razones(_nodo$);
    end if;
end;
$$ language plpgsql;

create or replace function nodo_indice$update$razones(_nodo$ bigint) returns void as $$
declare
    _row nodo_indice%ROWTYPE;
    _col nodo_indice%ROWTYPE;
begin
    if _nodo$ is not null then
        for _row in select * from nodo_indice where superior = _nodo$ order by codigo
        loop
            for _col in select * from nodo_indice where superior = _nodo$ order by codigo
            loop
                if _row.codigo < _col.codigo then
                    update razon_nodo_indice
                    set editable = true
                    where nodo = _nodo$
                    and numerador = _row.id
                    and denominador = _col.id;
                elsif _row.codigo = _col.codigo then
                else
                    update razon_nodo_indice
                    set editable = false,
                        ordinal_razon = (
                            select ordinal_razon.inversa
                            from razon_nodo_indice
                            inner join ordinal_razon
                            on ordinal_razon.numero = razon_nodo_indice.ordinal_razon
                            where nodo = _nodo$
                            and numerador = _col.id
                            and denominador = _row.id
                            )
                    where nodo = _nodo$
                    and numerador = _row.id
                    and denominador = _col.id;
                end if;
            end loop;
        end loop;
    end if;
end;
$$ language plpgsql;
