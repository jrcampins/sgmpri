create or replace function nodo_indice$references(_nodo$ bigint, _superior$ bigint)
returns boolean as $$
declare
    _sub bigint;
begin
    raise notice 'nodo_indice$references(nodo=%, superior=%)', _nodo$, _superior$;
    if _nodo$ is null or _superior$ is null then
        return false;
    end if;
    if _nodo$ = _superior$ then
        return true;
    end if;
    for _sub in select id from nodo_indice where superior = _nodo$
    loop
        if nodo_indice$references(_sub, _superior$) then
            return true;
        end if;
    end loop;
    return false;
end;
$$ language plpgsql;
