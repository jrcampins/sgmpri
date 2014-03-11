drop trigger if exists variable$after_insert_row$100 on variable cascade;
create trigger variable$after_insert_row$100 after insert on variable
    for each row execute procedure variable$after_insert_row$100();

drop trigger if exists variable$after_update_row$100 on variable cascade;
create trigger variable$after_update_row$100 after update on variable
    for each row execute procedure variable$after_update_row$100();
