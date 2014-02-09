create or replace function instalacion$after_insert_row$100() returns trigger as $$
declare
    _id_clase_recurso bigint;
    _id_conjunto_segmento bigint;
begin
    select id_clase_recurso into _id_clase_recurso from clase_recurso where codigo_clase_recurso='instalacion';
    if found then
        _id_conjunto_segmento := bigintid();
        insert into conjunto_segmento (
            id_conjunto_segmento,
            codigo_conjunto_segmento,
            nombre_conjunto_segmento,
            id_clase_recurso
        ) values (
            _id_conjunto_segmento,
            new.codigo,
            new.nombre,
            _id_clase_recurso
        );
        insert into elemento_segmento (
            id_elemento_segmento,
            segmento_entero_grande,
            id_segmento,
            codigo_segmento,
            nombre_segmento,
            id_conjunto_segmento
        ) values (
            bigintid(),
            new.id,
            new.id,
            new.codigo,
            new.nombre,
            _id_conjunto_segmento
        );
    end if;
    return null;
end;
$$ language plpgsql;
