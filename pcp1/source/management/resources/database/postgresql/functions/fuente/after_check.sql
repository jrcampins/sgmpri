create or replace function fuente$after_check(_new$ fuente)
returns boolean as $$
begin
    raise notice 'fuente$after_check(new=%)', _new$;
    if _new$.superior is null then
        null;
    elsif fuente$references(_new$.id, _new$.superior) then
        perform fuente$raise$circular(_new$.id, _new$.superior);
    end if;
    return true;
end;
$$ language plpgsql;

create or replace function fuente$after_check(_new$ fuente, _old$ fuente)
returns boolean as $$
begin
    raise notice 'fuente$after_check(new=%, old=%)', _new$, _old$;
    if _new$.superior is null or _new$.superior = _old$.superior then
        null;
    elsif fuente$references(_new$.id, _new$.superior) then
        perform fuente$raise$circular(_new$.id, _new$.superior);
    end if;
    return true;
end;
$$ language plpgsql;

create or replace function fuente$raise$circular(_nodo$ bigint, _superior$ bigint)
returns void as $$
declare
    _s01 character varying;
    _s02 character varying;
    _msg character varying;
begin
    select codigo into _s01 from fuente where id = _nodo$;
    select codigo into _s02 from fuente where id = _superior$;
    _msg := gettext('referencia circular; la fuente %s hace referencia (directa o indirecta) a la fuente %s');
    _msg := format(_msg, _s01, _s02);
    raise exception using message = _msg;
end;
$$ language plpgsql;
