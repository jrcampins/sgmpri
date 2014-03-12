create or replace function valor_nodo_indice$calcular(_id$ bigint, _cascade$ boolean) returns integer as $$
declare
    _msg character varying;
    _row valor_nodo_indice%ROWTYPE;
    _enum_tipo_nodo RECORD;
    _pdq RECORD;
    _brecha_1 numeric := 0; -- brecha (norma 1)
    _maxima_1 numeric := 0; -- brecha m�xima (norma 1)
    _normal_1 numeric; -- brecha normalizada (norma 1)
    _indice_1 numeric; -- �ndice (norma 1)
    _color_1 bigint;
    _brecha_2 numeric := 0; -- brecha (norma 2)
    _maxima_2 numeric := 0; -- brecha m�xima (norma 2)
    _normal_2 numeric; -- brecha normalizada (norma 2)
    _indice_2 numeric; -- �ndice (norma 2)
    _color_2 bigint;
begin
    raise notice 'valor_nodo_indice$calcular(id=%)', _id$;
    select * into _row from valor_nodo_indice where id = _id$;
    if not found then
        _msg := format(gettext('no existe %s con %s = %s'), 'valor nodo �ndice', 'id', _id$);
        raise exception using message = _msg;
    end if;
    _enum_tipo_nodo := tipo_nodo$enum();
    if _row.tipo_nodo = _enum_tipo_nodo.HOJA then
        return 0;
    end if;
    for _pdq in
        select *
        from valor_nodo_indice$rangos(_row.id, null)
        as rangos (
            nodo bigint,
            peso numeric,
            rango integer,
            rango_minimo integer,
            rango_maximo integer
        )
        order by 1
    loop
        _brecha_1 := _brecha_1 + _pdq.peso * ((_pdq.rango_maximo - _pdq.rango)^2);
        _maxima_1 := _maxima_1 + _pdq.peso * ((_pdq.rango_maximo - _pdq.rango_minimo)^2);
    end loop;
    if _brecha_1 is null or _maxima_1 is null or _maxima_1 = 0 then
        _brecha_1 := null;
        _maxima_1 := null;
    else
        _brecha_1 := |/_brecha_1;
        _maxima_1 := |/_maxima_1;
        _normal_1 := _brecha_1 / _maxima_1 * 100;
        _indice_1 := 100 - _normal_1;
        select color
        into _color_1
        from color_nodo_indice
        where nodo = _row.nodo
        and extremo_inferior <= _indice_1
        order by extremo_inferior desc;
    end if;
    update valor_nodo_indice
    set brecha_norma1 = _normal_1,
        indice_norma1 = _indice_1,
        color_norma1 = _color_1,
        brecha_norma2 = null,
        indice_norma2 = null,
        color_norma2 = null
    where id = _row.id;
    if _cascade$ then
        for _row in
        select * from valor_nodo_indice where superior = _id$ order by id
        loop
            if _row.tipo_nodo <> _enum_tipo_nodo.HOJA then
                perform valor_nodo_indice$calcular(_row.id, true);
            end if;
        end loop;
    end if;
    return 0;
end;
$$ language plpgsql;
