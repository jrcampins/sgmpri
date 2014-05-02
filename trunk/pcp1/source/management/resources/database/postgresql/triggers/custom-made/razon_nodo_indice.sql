/*
drop trigger if exists razon_nodo_indice$after_update_row$100 on razon_nodo_indice cascade;
create trigger razon_nodo_indice$after_update_row$100 after update on razon_nodo_indice
    for each row execute procedure razon_nodo_indice$after_update_row$100();
*/
