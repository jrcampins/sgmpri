create or replace function nodo_indice$update$fuente(_nodo$ bigint, _fuente$ bigint) returns void as $$
declare
    _enum_tipo_nodo RECORD;
    _sub nodo_indice%ROWTYPE;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    for _sub in select * from nodo_indice where superior = _nodo$
    loop
        update nodo_indice set fuente = _fuente$ where id = _sub.id;
        if _sub.tipo_nodo <> _enum_tipo_nodo.HOJA then
            perform nodo_indice$update$fuente(_sub.id, _fuente$);
        end if;
    end loop;
end;
$$ language plpgsql;
