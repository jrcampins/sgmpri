create or replace function nodo_indice$insert$razones(_nodo$ bigint) returns void as $$
declare
    _row nodo_indice%ROWTYPE;
    _col nodo_indice%ROWTYPE;
    _razon numeric;
    _editable boolean;
begin
    if _nodo$ is not null then
        for _row in select * from nodo_indice where superior = _nodo$ order by codigo
        loop
            for _col in select * from nodo_indice where superior = _nodo$ order by codigo
            loop
                select razon into _razon from razon_nodo_indice where nodo = _nodo$ and numerador = _row.id and denominador = _col.id;
                if not found then
                    if _row.id = _col.id then
                        _razon := 1;
                    else
                        select razon into _razon from razon_nodo_indice where nodo = _nodo$ and numerador = _col.id and denominador = _row.id;
                        if _razon is not null and _razon > 0 then
                            _razon := 1/_razon;
                        else
                            _razon := 1;
                        end if;
                    end if;
                    _editable := _row.codigo < _col.codigo;
                    insert
                    into razon_nodo_indice (id, nodo, numerador, denominador, razon, editable)
                    values (bigintid(), _nodo$, _row.id, _col.id, _razon, _editable);
                end if;
            end loop;
        end loop;
    end if;
end;
$$ language plpgsql;
