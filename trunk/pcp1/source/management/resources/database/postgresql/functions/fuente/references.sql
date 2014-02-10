create or replace function fuente$references(_nodo$ bigint, _superior$ bigint)
returns boolean as $$
declare
    _sub bigint;
begin
    raise notice 'fuente$references(nodo=%, superior=%)', _nodo$, _superior$;
    if _nodo$ is null or _superior$ is null then
        return false;
    end if;
    if _nodo$ = _superior$ then
        return true;
    end if;
    for _sub in select id from fuente where superior = _nodo$
    loop
        if fuente$references(_sub, _superior$) then
            return true;
        end if;
    end loop;
    return false;
end;
$$ language plpgsql;
