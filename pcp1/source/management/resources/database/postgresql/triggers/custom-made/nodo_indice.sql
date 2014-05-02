drop trigger if exists nodo_indice$after_insert_row$100 on nodo_indice cascade;
create trigger nodo_indice$after_insert_row$100 after insert on nodo_indice
    for each row execute procedure nodo_indice$after_insert_row$100();

drop trigger if exists nodo_indice$after_update_row$100 on nodo_indice cascade;
create trigger nodo_indice$after_update_row$100 after update on nodo_indice
    for each row execute procedure nodo_indice$after_update_row$100();

drop trigger if exists nodo_indice$after_delete_row$100 on nodo_indice cascade;
create trigger nodo_indice$after_delete_row$100 after delete on nodo_indice
    for each row execute procedure nodo_indice$after_delete_row$100();
