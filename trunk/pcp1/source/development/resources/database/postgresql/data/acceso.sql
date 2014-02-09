-- -----------------------------------------------------------------------------------------------------------
-- usuario
-- -----------------------------------------------------------------------------------------------------------
insert into usuario (id_usuario, codigo_usuario, nombre_usuario, password_usuario)
select bigintid(), 'jorge', 'Jorge Campins', '08b34b490b607342b007843310a284c6';

-- -----------------------------------------------------------------------------------------------------------
-- rol_usuario
-- -----------------------------------------------------------------------------------------------------------
insert into rol_usuario (id_rol_usuario, id_rol, id_usuario)
select bigintid() as id_rol_usuario, id_rol, id_usuario
from rol, usuario
where codigo_usuario='jorge' and es_rol_especial is false and numero_tipo_rol in (1,2,8)
order by 1;
