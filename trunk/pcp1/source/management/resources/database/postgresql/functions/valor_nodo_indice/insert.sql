create or replace function valor_nodo_indice$insert(_medicion_nodo$ bigint, _nodo$ bigint, _fecha_valor$ date)
returns void as $$
declare
    _msg character varying;
--  _enum_tipo_nodo RECORD;
--  _row nodo_indice%ROWTYPE;
    _sub nodo_indice%ROWTYPE;
begin
    raise notice 'valor_nodo_indice$insert(medicion=%, nodo=%, fecha=%)', _medicion_nodo$, _nodo$, _fecha_valor$;
--  _enum_tipo_nodo := tipo_nodo$enum();
--  select * into _row from nodo_indice where id = _nodo$;
--  if not found then
--      _msg := format(gettext('no existe %s con %s = %s'), 'nodo', 'id', _nodo$);
--      raise exception using message = _msg;
--  end if;
--  if _row.tipo_nodo <> _enum_tipo_nodo.HOJA then
        insert
        into valor_nodo_indice (id, medicion, nodo, fecha_valor)
        values (bigintid(), _medicion_nodo$, _nodo$, _fecha_valor$);
        for _sub in select * from nodo_indice where superior = _nodo$
        loop
            perform valor_nodo_indice$insert(_medicion_nodo$, _sub.id, _fecha_valor$);
        end loop;
--  end if;
end;
$$ language plpgsql;
