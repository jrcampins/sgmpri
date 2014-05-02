drop trigger if exists medicion_nodo$after_insert_row$100 on medicion_nodo cascade;
create trigger medicion_nodo$after_insert_row$100 after insert on medicion_nodo
    for each row execute procedure medicion_nodo$after_insert_row$100();
