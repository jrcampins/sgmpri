/*
drop trigger if exists fuente$after_insert_row$100 on fuente cascade;
create trigger fuente$after_insert_row$100 after insert on fuente
    for each row execute procedure fuente$after_insert_row$100();
*/
