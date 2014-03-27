create or replace function nodo_indice$recalcular$biz(_super$ bigint, _nodo$ bigint) returns integer as $$
declare
    _msg character varying;
    _enum_tipo_nodo RECORD;
    _row nodo_indice%ROWTYPE;
    _rowcount integer := 1;
begin
    _enum_tipo_nodo := tipo_nodo$enum();
    raise notice 'nodo_indice$recalcular$biz(%, %)', _super$, _nodo$;
    perform nodo_indice$update$peso_ahp(_nodo$);
    perform nodo_indice$update$peso_simplificado(_nodo$);
    for _row in select * from nodo_indice where superior = _nodo$ and tipo_nodo <> _enum_tipo_nodo.HOJA order by codigo
    loop
        _rowcount := _rowcount + nodo_indice$recalcular$biz(_super$, _row.id);
    end loop;
    return _rowcount;
end;
$$ language plpgsql;
