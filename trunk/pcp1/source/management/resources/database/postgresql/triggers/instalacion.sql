drop trigger if exists instalacion$after_insert_row$100 on instalacion cascade;
create trigger instalacion$after_insert_row$100 after insert on instalacion
    for each row execute procedure instalacion$after_insert_row$100();
