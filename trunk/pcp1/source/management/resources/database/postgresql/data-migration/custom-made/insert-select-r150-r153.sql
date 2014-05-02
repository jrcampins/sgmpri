/*
 * Este programa es software libre; usted puede redistribuirlo y/o modificarlo bajo los terminos
 * de la licencia "GNU General Public License" publicada por la Fundacion "Free Software Foundation".
 * Este programa se distribuye con la esperanza de que pueda ser util, pero SIN NINGUNA GARANTIA;
 * vea la licencia "GNU General Public License" para obtener mas informacion.
 */
/*
 * author: adalid 1.0
 * template: templates/database/postgresql/util/insert-select-past-data.vm
 * template-author: Jorge Campins
 */
drop schema if exists midway cascade;
create schema midway;

create or replace function midway.current_key_of_aplicacion(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_aplicacion(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_aplicacion(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.aplicacion.id_aplicacion
    into    _newkey$
    from    public.aplicacion,
            former.aplicacion
    where   former.aplicacion.codigo_aplicacion = public.aplicacion.codigo_aplicacion
    and     former.aplicacion.id_aplicacion = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of aplicacion.id_aplicacion % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_clase_recurso(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_clase_recurso(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_clase_recurso(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.clase_recurso.id_clase_recurso
    into    _newkey$
    from    public.clase_recurso,
            former.clase_recurso
    where   former.clase_recurso.codigo_clase_recurso = public.clase_recurso.codigo_clase_recurso
    and     former.clase_recurso.id_clase_recurso = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of clase_recurso.id_clase_recurso % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_eje_fun(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_condicion_eje_fun(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_eje_fun(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.condicion_eje_fun.numero_condicion_eje_fun
    into    _newkey$
    from    public.condicion_eje_fun,
            former.condicion_eje_fun
    where   former.condicion_eje_fun.codigo_condicion_eje_fun = public.condicion_eje_fun.codigo_condicion_eje_fun
    and     former.condicion_eje_fun.numero_condicion_eje_fun = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of condicion_eje_fun.numero_condicion_eje_fun % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_medicion_nodo(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_condicion_medicion_nodo(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_medicion_nodo(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.condicion_medicion_nodo.numero
    into    _newkey$
    from    public.condicion_medicion_nodo,
            former.condicion_medicion_nodo
    where   former.condicion_medicion_nodo.codigo = public.condicion_medicion_nodo.codigo
    and     former.condicion_medicion_nodo.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of condicion_medicion_nodo.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_medicion_rama(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_condicion_medicion_rama(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_medicion_rama(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.condicion_medicion_rama.numero
    into    _newkey$
    from    public.condicion_medicion_rama,
            former.condicion_medicion_rama
    where   former.condicion_medicion_rama.codigo = public.condicion_medicion_rama.codigo
    and     former.condicion_medicion_rama.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of condicion_medicion_rama.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_tarea(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_condicion_tarea(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_condicion_tarea(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.condicion_tarea.numero_condicion_tarea
    into    _newkey$
    from    public.condicion_tarea,
            former.condicion_tarea
    where   former.condicion_tarea.codigo_condicion_tarea = public.condicion_tarea.codigo_condicion_tarea
    and     former.condicion_tarea.numero_condicion_tarea = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of condicion_tarea.numero_condicion_tarea % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_dominio(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_dominio(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_dominio(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.dominio.id_dominio
    into    _newkey$
    from    public.dominio,
            former.dominio
    where   former.dominio.codigo_dominio = public.dominio.codigo_dominio
    and     former.dominio.id_dominio = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of dominio.id_dominio % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_dominio_parametro(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_dominio_parametro(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_dominio_parametro(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.dominio_parametro.id_dominio_parametro
    into    _newkey$
    from    public.dominio_parametro,
            former.dominio_parametro
    where   former.dominio_parametro.codigo_dominio_parametro = public.dominio_parametro.codigo_dominio_parametro
    and     former.dominio_parametro.id_dominio_parametro = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of dominio_parametro.id_dominio_parametro % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_funcion(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_funcion(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_funcion(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.funcion.id_funcion
    into    _newkey$
    from    public.funcion,
            former.funcion
    where   former.funcion.codigo_funcion = public.funcion.codigo_funcion
    and     former.funcion.id_funcion = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of funcion.id_funcion % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_funcion_parametro(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_funcion_parametro(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_funcion_parametro(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.funcion_parametro.id_funcion_parametro
    into    _newkey$
    from    public.funcion_parametro,
            former.funcion_parametro
    where   former.funcion_parametro.codigo_funcion_parametro = public.funcion_parametro.codigo_funcion_parametro
    and     former.funcion_parametro.id_funcion_parametro = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of funcion_parametro.id_funcion_parametro % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_grupo_proceso(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_grupo_proceso(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_grupo_proceso(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.grupo_proceso.id_grupo_proceso
    into    _newkey$
    from    public.grupo_proceso,
            former.grupo_proceso
    where   former.grupo_proceso.codigo_grupo_proceso = public.grupo_proceso.codigo_grupo_proceso
    and     former.grupo_proceso.id_grupo_proceso = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of grupo_proceso.id_grupo_proceso % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_impacto_nodo(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_impacto_nodo(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_impacto_nodo(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.impacto_nodo.numero
    into    _newkey$
    from    public.impacto_nodo,
            former.impacto_nodo
    where   former.impacto_nodo.codigo = public.impacto_nodo.codigo
    and     former.impacto_nodo.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of impacto_nodo.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_nivel_opcion_menu(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_nivel_opcion_menu(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_nivel_opcion_menu(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.nivel_opcion_menu.numero_nivel_opcion_menu
    into    _newkey$
    from    public.nivel_opcion_menu,
            former.nivel_opcion_menu
    where   former.nivel_opcion_menu.codigo_nivel_opcion_menu = public.nivel_opcion_menu.codigo_nivel_opcion_menu
    and     former.nivel_opcion_menu.numero_nivel_opcion_menu = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of nivel_opcion_menu.numero_nivel_opcion_menu % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_opcion_menu(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_opcion_menu(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_opcion_menu(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.opcion_menu.id_opcion_menu
    into    _newkey$
    from    public.opcion_menu,
            former.opcion_menu
    where   former.opcion_menu.codigo_opcion_menu = public.opcion_menu.codigo_opcion_menu
    and     former.opcion_menu.id_opcion_menu = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of opcion_menu.id_opcion_menu % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_operador_com(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_operador_com(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_operador_com(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.operador_com.numero_operador_com
    into    _newkey$
    from    public.operador_com,
            former.operador_com
    where   former.operador_com.codigo_operador_com = public.operador_com.codigo_operador_com
    and     former.operador_com.numero_operador_com = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of operador_com.numero_operador_com % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_ordinal_razon(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_ordinal_razon(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_ordinal_razon(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.ordinal_razon.numero
    into    _newkey$
    from    public.ordinal_razon,
            former.ordinal_razon
    where   former.ordinal_razon.codigo = public.ordinal_razon.codigo
    and     former.ordinal_razon.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of ordinal_razon.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_pagina(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_pagina(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_pagina(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.pagina.id_pagina
    into    _newkey$
    from    public.pagina,
            former.pagina
    where   former.pagina.codigo_pagina = public.pagina.codigo_pagina
    and     former.pagina.id_pagina = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of pagina.id_pagina % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_parametro(bigint) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _newkey$ bigint;
begin
    _newkey$ := midway.current_key_of_parametro(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_parametro(bigint, boolean) returns bigint as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ bigint;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.parametro.id_parametro
    into    _newkey$
    from    public.parametro,
            former.parametro
    where   former.parametro.codigo_parametro = public.parametro.codigo_parametro
    and     former.parametro.id_parametro = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of parametro.id_parametro % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_clase_recurso(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_clase_recurso(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_clase_recurso(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_clase_recurso.numero_tipo_clase_recurso
    into    _newkey$
    from    public.tipo_clase_recurso,
            former.tipo_clase_recurso
    where   former.tipo_clase_recurso.codigo_tipo_clase_recurso = public.tipo_clase_recurso.codigo_tipo_clase_recurso
    and     former.tipo_clase_recurso.numero_tipo_clase_recurso = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_clase_recurso.numero_tipo_clase_recurso % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_comparacion(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_comparacion(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_comparacion(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_comparacion.numero_tipo_comparacion
    into    _newkey$
    from    public.tipo_comparacion,
            former.tipo_comparacion
    where   former.tipo_comparacion.codigo_tipo_comparacion = public.tipo_comparacion.codigo_tipo_comparacion
    and     former.tipo_comparacion.numero_tipo_comparacion = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_comparacion.numero_tipo_comparacion % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_dato_par(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_dato_par(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_dato_par(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_dato_par.numero_tipo_dato_par
    into    _newkey$
    from    public.tipo_dato_par,
            former.tipo_dato_par
    where   former.tipo_dato_par.codigo_tipo_dato_par = public.tipo_dato_par.codigo_tipo_dato_par
    and     former.tipo_dato_par.numero_tipo_dato_par = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_dato_par.numero_tipo_dato_par % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_documento_prueba(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_documento_prueba(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_documento_prueba(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_documento_prueba.numero
    into    _newkey$
    from    public.tipo_documento_prueba,
            former.tipo_documento_prueba
    where   former.tipo_documento_prueba.codigo = public.tipo_documento_prueba.codigo
    and     former.tipo_documento_prueba.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_documento_prueba.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_dominio(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_dominio(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_dominio(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_dominio.numero_tipo_dominio
    into    _newkey$
    from    public.tipo_dominio,
            former.tipo_dominio
    where   former.tipo_dominio.codigo_tipo_dominio = public.tipo_dominio.codigo_tipo_dominio
    and     former.tipo_dominio.numero_tipo_dominio = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_dominio.numero_tipo_dominio % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_funcion(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_funcion(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_funcion(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_funcion.numero_tipo_funcion
    into    _newkey$
    from    public.tipo_funcion,
            former.tipo_funcion
    where   former.tipo_funcion.codigo_tipo_funcion = public.tipo_funcion.codigo_tipo_funcion
    and     former.tipo_funcion.numero_tipo_funcion = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_funcion.numero_tipo_funcion % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_nodo(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_nodo(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_nodo(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_nodo.numero_tipo_nodo
    into    _newkey$
    from    public.tipo_nodo,
            former.tipo_nodo
    where   former.tipo_nodo.codigo_tipo_nodo = public.tipo_nodo.codigo_tipo_nodo
    and     former.tipo_nodo.numero_tipo_nodo = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_nodo.numero_tipo_nodo % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_pagina(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_pagina(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_pagina(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_pagina.numero_tipo_pagina
    into    _newkey$
    from    public.tipo_pagina,
            former.tipo_pagina
    where   former.tipo_pagina.codigo_tipo_pagina = public.tipo_pagina.codigo_tipo_pagina
    and     former.tipo_pagina.numero_tipo_pagina = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_pagina.numero_tipo_pagina % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_parametro(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_parametro(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_parametro(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_parametro.numero_tipo_parametro
    into    _newkey$
    from    public.tipo_parametro,
            former.tipo_parametro
    where   former.tipo_parametro.codigo_tipo_parametro = public.tipo_parametro.codigo_tipo_parametro
    and     former.tipo_parametro.numero_tipo_parametro = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_parametro.numero_tipo_parametro % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_parametro_dom(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_parametro_dom(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_parametro_dom(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_parametro_dom.numero_tipo_parametro_dom
    into    _newkey$
    from    public.tipo_parametro_dom,
            former.tipo_parametro_dom
    where   former.tipo_parametro_dom.codigo_tipo_parametro_dom = public.tipo_parametro_dom.codigo_tipo_parametro_dom
    and     former.tipo_parametro_dom.numero_tipo_parametro_dom = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_parametro_dom.numero_tipo_parametro_dom % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_peso_nodo(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_peso_nodo(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_peso_nodo(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_peso_nodo.numero
    into    _newkey$
    from    public.tipo_peso_nodo,
            former.tipo_peso_nodo
    where   former.tipo_peso_nodo.codigo = public.tipo_peso_nodo.codigo
    and     former.tipo_peso_nodo.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_peso_nodo.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_pieza_prueba(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_pieza_prueba(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_pieza_prueba(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_pieza_prueba.numero
    into    _newkey$
    from    public.tipo_pieza_prueba,
            former.tipo_pieza_prueba
    where   former.tipo_pieza_prueba.codigo = public.tipo_pieza_prueba.codigo
    and     former.tipo_pieza_prueba.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_pieza_prueba.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_rastro_fun(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_rastro_fun(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_rastro_fun(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_rastro_fun.numero_tipo_rastro_fun
    into    _newkey$
    from    public.tipo_rastro_fun,
            former.tipo_rastro_fun
    where   former.tipo_rastro_fun.codigo_tipo_rastro_fun = public.tipo_rastro_fun.codigo_tipo_rastro_fun
    and     former.tipo_rastro_fun.numero_tipo_rastro_fun = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_rastro_fun.numero_tipo_rastro_fun % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_recurso(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_recurso(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_recurso(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_recurso.numero_tipo_recurso
    into    _newkey$
    from    public.tipo_recurso,
            former.tipo_recurso
    where   former.tipo_recurso.codigo_tipo_recurso = public.tipo_recurso.codigo_tipo_recurso
    and     former.tipo_recurso.numero_tipo_recurso = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_recurso.numero_tipo_recurso % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_resultado_prueba(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_resultado_prueba(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_resultado_prueba(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_resultado_prueba.numero
    into    _newkey$
    from    public.tipo_resultado_prueba,
            former.tipo_resultado_prueba
    where   former.tipo_resultado_prueba.codigo = public.tipo_resultado_prueba.codigo
    and     former.tipo_resultado_prueba.numero = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_resultado_prueba.numero % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_rol(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_rol(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_rol(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_rol.numero_tipo_rol
    into    _newkey$
    from    public.tipo_rol,
            former.tipo_rol
    where   former.tipo_rol.codigo_tipo_rol = public.tipo_rol.codigo_tipo_rol
    and     former.tipo_rol.numero_tipo_rol = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_rol.numero_tipo_rol % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_valor(integer) returns integer as $$
declare
    _oldkey$ alias for $1;
    _newkey$ integer;
begin
    _newkey$ := midway.current_key_of_tipo_valor(_oldkey$, true);
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.current_key_of_tipo_valor(integer, boolean) returns integer as $$
declare
    _oldkey$ alias for $1;
    _strict$ alias for $2;
    _newkey$ integer;
begin
    if _oldkey$ is null then
        return null;
    end if;
    /**/
    select  public.tipo_valor.numero_tipo_valor
    into    _newkey$
    from    public.tipo_valor,
            former.tipo_valor
    where   former.tipo_valor.codigo_tipo_valor = public.tipo_valor.codigo_tipo_valor
    and     former.tipo_valor.numero_tipo_valor = _oldkey$;
    /**/
    if not found then
        if _strict$ is true then
            raise exception 'current key of tipo_valor.numero_tipo_valor % is null', _oldkey$;
        end if;
    end if;
    /**/
    return _newkey$;
end;
$$ language plpgsql;

create or replace function midway.insert_select_ambiente_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.ambiente_prueba
        (
        id,
        version,
        codigo,
        nombre,
        descripcion,
        actual
        )
    select
        ambiente_prueba.id,
        ambiente_prueba.version,
        ambiente_prueba.codigo,
        ambiente_prueba.nombre,
        ambiente_prueba.descripcion,
        ambiente_prueba.actual
    from former.ambiente_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_archivo_adjunto() returns integer as $$
declare
    rows integer;
begin
    insert into public.archivo_adjunto
        (
        id,
        archivo_cliente,
        archivo_servidor,
        propietario,
        fecha_hora_carga,
        tipo_contenido,
        longitud,
        octetos
        )
    select
        archivo_adjunto.id,
        archivo_adjunto.archivo_cliente,
        archivo_adjunto.archivo_servidor,
        archivo_adjunto.propietario,
        archivo_adjunto.fecha_hora_carga,
        archivo_adjunto.tipo_contenido,
        archivo_adjunto.longitud,
        archivo_adjunto.octetos
    from former.archivo_adjunto
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_caso_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.caso_prueba
        (
        id,
        version,
        codigo,
        nombre,
        descripcion,
        comentarios,
        precondiciones,
        validaciones,
        acciones,
        poscondiciones,
        invariantes,
        paquete,
        funcion,
        rol,
        propietario
        )
    select
        caso_prueba.id,
        caso_prueba.version,
        caso_prueba.codigo,
        caso_prueba.nombre,
        caso_prueba.descripcion,
        caso_prueba.comentarios,
        caso_prueba.precondiciones,
        caso_prueba.validaciones,
        caso_prueba.acciones,
        caso_prueba.poscondiciones,
        caso_prueba.invariantes,
        caso_prueba.paquete,
        midway.current_key_of_funcion(caso_prueba.funcion),
        caso_prueba.rol,
        caso_prueba.propietario
    from former.caso_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_color_indice() returns integer as $$
declare
    rows integer;
begin
    insert into public.color_indice
        (
        id,
        version,
        codigo,
        extremo_inferior
        )
    select
        color_indice.id,
        color_indice.version,
        color_indice.codigo,
        color_indice.extremo_inferior
    from former.color_indice
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_color_nodo_indice() returns integer as $$
declare
    rows integer;
begin
    insert into public.color_nodo_indice
        (
        id,
        version,
        nodo,
        color,
        extremo_inferior
        )
    select
        color_nodo_indice.id,
        color_nodo_indice.version,
        color_nodo_indice.nodo,
        color_nodo_indice.color,
        color_nodo_indice.extremo_inferior
    from former.color_nodo_indice
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_conjunto_segmento() returns integer as $$
declare
    rows integer;
begin
    insert into public.conjunto_segmento
        (
        id_conjunto_segmento,
        version_conjunto_segmento,
        codigo_conjunto_segmento,
        nombre_conjunto_segmento,
        descripcion_conjunto_segmento,
        id_clase_recurso
        )
    select
        conjunto_segmento.id_conjunto_segmento,
        conjunto_segmento.version_conjunto_segmento,
        conjunto_segmento.codigo_conjunto_segmento,
        conjunto_segmento.nombre_conjunto_segmento,
        conjunto_segmento.descripcion_conjunto_segmento,
        midway.current_key_of_clase_recurso(conjunto_segmento.id_clase_recurso)
    from former.conjunto_segmento
    order by id_conjunto_segmento;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_documento_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.documento_prueba
        (
        id,
        version,
        tipo,
        archivo,
        descripcion,
        adjunto,
        fecha_hora_carga,
        caso_x1,
        escenario_x2,
        programa_x3,
        linea_x4,
        ejecucion_programa_x5,
        ejecucion_linea_x6,
        registrado_x6
        )
    select
        documento_prueba.id,
        documento_prueba.version,
        midway.current_key_of_tipo_documento_prueba(documento_prueba.tipo),
        documento_prueba.archivo,
        documento_prueba.descripcion,
        documento_prueba.adjunto,
        documento_prueba.fecha_hora_carga,
        documento_prueba.caso_x1,
        documento_prueba.escenario_x2,
        documento_prueba.programa_x3,
        documento_prueba.linea_x4,
        documento_prueba.ejecucion_programa_x5,
        documento_prueba.ejecucion_linea_x6,
        documento_prueba.registrado_x6
    from former.documento_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_ejecucion_linea_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.ejecucion_linea_prueba
        (
        id,
        version,
        codigo,
        numero,
        nivel,
        ejecucion,
        programa,
        escenario,
        subprograma,
        condiciones,
        repeticiones,
        comentarios,
        resultados,
        observaciones,
        archivo,
        rastro,
        condicion_ejecucion,
        fecha_hora_condicion_ejecucion,
        tipo_resultado,
        resultado_esperado,
        superior
        )
    select
        ejecucion_linea_prueba.id,
        ejecucion_linea_prueba.version,
        ejecucion_linea_prueba.codigo,
        ejecucion_linea_prueba.numero,
        ejecucion_linea_prueba.nivel,
        ejecucion_linea_prueba.ejecucion,
        ejecucion_linea_prueba.programa,
        ejecucion_linea_prueba.escenario,
        ejecucion_linea_prueba.subprograma,
        ejecucion_linea_prueba.condiciones,
        ejecucion_linea_prueba.repeticiones,
        ejecucion_linea_prueba.comentarios,
        ejecucion_linea_prueba.resultados,
        ejecucion_linea_prueba.observaciones,
        ejecucion_linea_prueba.archivo,
        ejecucion_linea_prueba.rastro,
        midway.current_key_of_condicion_eje_fun(ejecucion_linea_prueba.condicion_ejecucion),
        ejecucion_linea_prueba.fecha_hora_condicion_ejecucion,
        midway.current_key_of_tipo_resultado_prueba(ejecucion_linea_prueba.tipo_resultado),
        ejecucion_linea_prueba.resultado_esperado,
        ejecucion_linea_prueba.superior
    from former.ejecucion_linea_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_ejecucion_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.ejecucion_prueba
        (
        id,
        version,
        codigo,
        nombre,
        descripcion,
        comentarios,
        ambiente,
        paquete,
        programa,
        condicion_ejecucion,
        fecha_hora_condicion_ejecucion,
        tipo_resultado,
        resultado_esperado,
        responsable
        )
    select
        ejecucion_prueba.id,
        ejecucion_prueba.version,
        ejecucion_prueba.codigo,
        ejecucion_prueba.nombre,
        ejecucion_prueba.descripcion,
        ejecucion_prueba.comentarios,
        ejecucion_prueba.ambiente,
        ejecucion_prueba.paquete,
        ejecucion_prueba.programa,
        midway.current_key_of_condicion_eje_fun(ejecucion_prueba.condicion_ejecucion),
        ejecucion_prueba.fecha_hora_condicion_ejecucion,
        midway.current_key_of_tipo_resultado_prueba(ejecucion_prueba.tipo_resultado),
        ejecucion_prueba.resultado_esperado,
        ejecucion_prueba.responsable
    from former.ejecucion_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_elemento_segmento() returns integer as $$
declare
    rows integer;
begin
    insert into public.elemento_segmento
        (
        id_elemento_segmento,
        version_elemento_segmento,
        segmento_entero_grande,
        id_segmento,
        codigo_segmento,
        nombre_segmento,
        id_conjunto_segmento
        )
    select
        elemento_segmento.id_elemento_segmento,
        elemento_segmento.version_elemento_segmento,
        elemento_segmento.segmento_entero_grande,
        elemento_segmento.id_segmento,
        elemento_segmento.codigo_segmento,
        elemento_segmento.nombre_segmento,
        elemento_segmento.id_conjunto_segmento
    from former.elemento_segmento
    order by id_elemento_segmento;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_escenario_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.escenario_prueba
        (
        id,
        version,
        codigo,
        numero,
        nombre,
        descripcion,
        comentarios,
        precondiciones,
        validaciones,
        acciones,
        poscondiciones,
        invariantes,
        pseudocodigo,
        resultados,
        tipo_resultado,
        caso
        )
    select
        escenario_prueba.id,
        escenario_prueba.version,
        escenario_prueba.codigo,
        escenario_prueba.numero,
        escenario_prueba.nombre,
        escenario_prueba.descripcion,
        escenario_prueba.comentarios,
        escenario_prueba.precondiciones,
        escenario_prueba.validaciones,
        escenario_prueba.acciones,
        escenario_prueba.poscondiciones,
        escenario_prueba.invariantes,
        escenario_prueba.pseudocodigo,
        escenario_prueba.resultados,
        midway.current_key_of_tipo_resultado_prueba(escenario_prueba.tipo_resultado),
        escenario_prueba.caso
    from former.escenario_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_fila_matriz_razon() returns integer as $$
declare
    rows integer;
begin
    insert into public.fila_matriz_razon
        (
        id,
        version,
        codigo,
        nodo,
        fila,
        dimension,
        c01,
        c02,
        c03,
        c04,
        c05,
        c06,
        c07,
        c08,
        c09,
        c10,
        c11,
        c12,
        c13,
        c14,
        c15,
        c16,
        c17,
        c18,
        c19,
        c20,
        claves,
        etiquetas
        )
    select
        fila_matriz_razon.id,
        fila_matriz_razon.version,
        fila_matriz_razon.codigo,
        fila_matriz_razon.nodo,
        fila_matriz_razon.fila,
        fila_matriz_razon.dimension,
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c01),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c02),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c03),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c04),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c05),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c06),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c07),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c08),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c09),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c10),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c11),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c12),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c13),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c14),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c15),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c16),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c17),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c18),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c19),
        midway.current_key_of_ordinal_razon(fila_matriz_razon.c20),
        fila_matriz_razon.claves,
        fila_matriz_razon.etiquetas
    from former.fila_matriz_razon
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_filtro_funcion() returns integer as $$
declare
    rows integer;
begin
    insert into public.filtro_funcion
        (
        id_filtro_funcion,
        version_filtro_funcion,
        nombre_filtro_funcion,
        codigo_filtro_funcion,
        descripcion_filtro_funcion,
        id_funcion,
        id_usuario,
        es_publico,
        id_filtro_funcion_original
        )
    select
        filtro_funcion.id_filtro_funcion,
        filtro_funcion.version_filtro_funcion,
        filtro_funcion.nombre_filtro_funcion,
        filtro_funcion.codigo_filtro_funcion,
        filtro_funcion.descripcion_filtro_funcion,
        midway.current_key_of_funcion(filtro_funcion.id_funcion),
        filtro_funcion.id_usuario,
        filtro_funcion.es_publico,
        filtro_funcion.id_filtro_funcion_original
    from former.filtro_funcion
    order by id_filtro_funcion;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_filtro_funcion_par() returns integer as $$
declare
    rows integer;
begin
    insert into public.filtro_funcion_par
        (
        id_filtro_funcion_par,
        version_filtro_funcion_par,
        id_filtro_funcion,
        id_funcion_parametro,
        numero_operador_com,
        valor,
        valor_fecha_hora,
        recurso_valor,
        id_recurso_valor,
        codigo_recurso_valor,
        nombre_recurso_valor
        )
    select
        filtro_funcion_par.id_filtro_funcion_par,
        filtro_funcion_par.version_filtro_funcion_par,
        filtro_funcion_par.id_filtro_funcion,
        midway.current_key_of_funcion_parametro(filtro_funcion_par.id_funcion_parametro),
        midway.current_key_of_operador_com(filtro_funcion_par.numero_operador_com),
        filtro_funcion_par.valor,
        filtro_funcion_par.valor_fecha_hora,
        filtro_funcion_par.recurso_valor,
        filtro_funcion_par.id_recurso_valor,
        filtro_funcion_par.codigo_recurso_valor,
        filtro_funcion_par.nombre_recurso_valor
    from former.filtro_funcion_par
    order by id_filtro_funcion_par;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_linea_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.linea_prueba
        (
        id,
        version,
        codigo,
        numero,
        programa,
        escenario,
        subprograma,
        condiciones,
        repeticiones,
        comentarios
        )
    select
        linea_prueba.id,
        linea_prueba.version,
        linea_prueba.codigo,
        linea_prueba.numero,
        linea_prueba.programa,
        linea_prueba.escenario,
        linea_prueba.subprograma,
        linea_prueba.condiciones,
        linea_prueba.repeticiones,
        linea_prueba.comentarios
    from former.linea_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_medicion_nodo() returns integer as $$
declare
    rows integer;
begin
    insert into public.medicion_nodo
        (
        id,
        version,
        codigo,
        nombre,
        nodo,
        programador,
        fecha_programacion,
        anulador,
        fecha_anulacion,
        condicion,
        fecha_condicion,
        observaciones,
        comentarios
        )
    select
        medicion_nodo.id,
        medicion_nodo.version,
        medicion_nodo.codigo,
        medicion_nodo.nombre,
        medicion_nodo.nodo,
        medicion_nodo.programador,
        medicion_nodo.fecha_programacion,
        medicion_nodo.anulador,
        medicion_nodo.fecha_anulacion,
        midway.current_key_of_condicion_medicion_nodo(medicion_nodo.condicion),
        medicion_nodo.fecha_condicion,
        medicion_nodo.observaciones,
        medicion_nodo.comentarios
    from former.medicion_nodo
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_medicion_rama() returns integer as $$
declare
    rows integer;
begin
    insert into public.medicion_rama
        (
        id,
        version,
        codigo,
        nombre,
        medicion,
        rama,
        registrador,
        fecha_registro,
        verificador,
        fecha_verificacion,
        condicion,
        fecha_condicion,
        observaciones,
        archivo,
        adjunto,
        comentarios
        )
    select
        medicion_rama.id,
        medicion_rama.version,
        medicion_rama.codigo,
        medicion_rama.nombre,
        medicion_rama.medicion,
        medicion_rama.rama,
        medicion_rama.registrador,
        medicion_rama.fecha_registro,
        medicion_rama.verificador,
        medicion_rama.fecha_verificacion,
        midway.current_key_of_condicion_medicion_rama(medicion_rama.condicion),
        medicion_rama.fecha_condicion,
        medicion_rama.observaciones,
        medicion_rama.archivo,
        medicion_rama.adjunto,
        medicion_rama.comentarios
    from former.medicion_rama
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_medicion_variable() returns integer as $$
declare
    rows integer;
begin
    insert into public.medicion_variable
        (
        id,
        version,
        medicion,
        hoja,
        variable,
        rango,
        comentarios
        )
    select
        medicion_variable.id,
        medicion_variable.version,
        medicion_variable.medicion,
        medicion_variable.hoja,
        medicion_variable.variable,
        medicion_variable.rango,
        medicion_variable.comentarios
    from former.medicion_variable
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_nodo_indice() returns integer as $$
declare
    rows integer;
begin
    insert into public.nodo_indice
        (
        id,
        version,
        codigo,
        nombre,
        tipo_nodo,
        subordinados,
        superior,
        variable,
        tipo_peso_nodo,
        impacto,
        peso_asignado,
        peso_a_h_p,
        peso_simplificado
        )
    select
        nodo_indice.id,
        nodo_indice.version,
        nodo_indice.codigo,
        nodo_indice.nombre,
        midway.current_key_of_tipo_nodo(nodo_indice.tipo_nodo),
        nodo_indice.subordinados,
        nodo_indice.superior,
        nodo_indice.variable,
        midway.current_key_of_tipo_peso_nodo(nodo_indice.tipo_peso_nodo),
        midway.current_key_of_impacto_nodo(nodo_indice.impacto),
        nodo_indice.peso_asignado,
        nodo_indice.peso_a_h_p,
        nodo_indice.peso_simplificado
    from former.nodo_indice
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_pagina_usuario() returns integer as $$
declare
    rows integer;
begin
    insert into public.pagina_usuario
        (
        id_pagina_usuario,
        version_pagina_usuario,
        id_pagina,
        id_usuario
        )
    select
        pagina_usuario.id_pagina_usuario,
        pagina_usuario.version_pagina_usuario,
        midway.current_key_of_pagina(pagina_usuario.id_pagina),
        pagina_usuario.id_usuario
    from former.pagina_usuario
    order by id_pagina_usuario;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_paquete_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.paquete_prueba
        (
        id,
        version,
        codigo,
        nombre,
        descripcion
        )
    select
        paquete_prueba.id,
        paquete_prueba.version,
        paquete_prueba.codigo,
        paquete_prueba.nombre,
        paquete_prueba.descripcion
    from former.paquete_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_parametro_linea_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.parametro_linea_prueba
        (
        id,
        version,
        ejecucion,
        codigo,
        nombre,
        tipo,
        valor,
        registrado
        )
    select
        parametro_linea_prueba.id,
        parametro_linea_prueba.version,
        parametro_linea_prueba.ejecucion,
        parametro_linea_prueba.codigo,
        parametro_linea_prueba.nombre,
        midway.current_key_of_tipo_dato_par(parametro_linea_prueba.tipo),
        parametro_linea_prueba.valor,
        parametro_linea_prueba.registrado
    from former.parametro_linea_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_parte_ambiente_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.parte_ambiente_prueba
        (
        id,
        version,
        ambiente,
        pieza,
        version_implementacion
        )
    select
        parte_ambiente_prueba.id,
        parte_ambiente_prueba.version,
        parte_ambiente_prueba.ambiente,
        parte_ambiente_prueba.pieza,
        parte_ambiente_prueba.version_implementacion
    from former.parte_ambiente_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_pieza_ambiente_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.pieza_ambiente_prueba
        (
        id,
        version,
        codigo,
        nombre,
        descripcion,
        tipo
        )
    select
        pieza_ambiente_prueba.id,
        pieza_ambiente_prueba.version,
        pieza_ambiente_prueba.codigo,
        pieza_ambiente_prueba.nombre,
        pieza_ambiente_prueba.descripcion,
        midway.current_key_of_tipo_pieza_prueba(pieza_ambiente_prueba.tipo)
    from former.pieza_ambiente_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_programa_prueba() returns integer as $$
declare
    rows integer;
begin
    insert into public.programa_prueba
        (
        id,
        version,
        codigo,
        nombre,
        descripcion,
        comentarios,
        paquete,
        caso,
        propietario
        )
    select
        programa_prueba.id,
        programa_prueba.version,
        programa_prueba.codigo,
        programa_prueba.nombre,
        programa_prueba.descripcion,
        programa_prueba.comentarios,
        programa_prueba.paquete,
        programa_prueba.caso,
        programa_prueba.propietario
    from former.programa_prueba
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rango_variable() returns integer as $$
declare
    rows integer;
begin
    insert into public.rango_variable
        (
        id,
        version,
        variable,
        numeral,
        expresion
        )
    select
        rango_variable.id,
        rango_variable.version,
        rango_variable.variable,
        rango_variable.numeral,
        rango_variable.expresion
    from former.rango_variable
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rastro_funcion() returns integer as $$
declare
    rows integer;
begin
    insert into public.rastro_funcion
        (
        id_rastro_funcion,
        fecha_hora_ejecucion,
        id_usuario,
        id_funcion,
        id_recurso,
        version_recurso,
        codigo_recurso,
        nombre_recurso,
        id_propietario_recurso,
        id_segmento_recurso,
        numero_condicion_eje_fun,
        descripcion_error
        )
    select
        rastro_funcion.id_rastro_funcion,
        rastro_funcion.fecha_hora_ejecucion,
        rastro_funcion.id_usuario,
        midway.current_key_of_funcion(rastro_funcion.id_funcion),
        rastro_funcion.id_recurso,
        rastro_funcion.version_recurso,
        rastro_funcion.codigo_recurso,
        rastro_funcion.nombre_recurso,
        rastro_funcion.id_propietario_recurso,
        rastro_funcion.id_segmento_recurso,
        midway.current_key_of_condicion_eje_fun(rastro_funcion.numero_condicion_eje_fun),
        rastro_funcion.descripcion_error
    from former.rastro_funcion
    order by id_rastro_funcion;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rastro_funcion_par() returns integer as $$
declare
    rows integer;
begin
    insert into public.rastro_funcion_par
        (
        id_rastro_funcion_par,
        id_rastro_funcion,
        id_parametro,
        valor_parametro
        )
    select
        rastro_funcion_par.id_rastro_funcion_par,
        rastro_funcion_par.id_rastro_funcion,
        midway.current_key_of_parametro(rastro_funcion_par.id_parametro),
        rastro_funcion_par.valor_parametro
    from former.rastro_funcion_par
    order by id_rastro_funcion_par;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rastro_informe() returns integer as $$
declare
    rows integer;
begin
    insert into public.rastro_informe
        (
        id_rastro_informe,
        fecha_hora_inicio_ejecucion,
        fecha_hora_fin_ejecucion,
        id_usuario,
        id_funcion,
        numero_condicion_eje_fun,
        nombre_archivo,
        descripcion_error
        )
    select
        rastro_informe.id_rastro_informe,
        rastro_informe.fecha_hora_inicio_ejecucion,
        rastro_informe.fecha_hora_fin_ejecucion,
        rastro_informe.id_usuario,
        midway.current_key_of_funcion(rastro_informe.id_funcion),
        midway.current_key_of_condicion_eje_fun(rastro_informe.numero_condicion_eje_fun),
        rastro_informe.nombre_archivo,
        rastro_informe.descripcion_error
    from former.rastro_informe
    order by id_rastro_informe;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rastro_proceso() returns integer as $$
declare
    rows integer;
begin
    insert into public.rastro_proceso
        (
        id_rastro_proceso,
        fecha_hora_inicio_ejecucion,
        fecha_hora_fin_ejecucion,
        id_usuario,
        id_funcion,
        id_recurso,
        version_recurso,
        codigo_recurso,
        nombre_recurso,
        id_propietario_recurso,
        id_segmento_recurso,
        numero_condicion_eje_fun,
        nombre_archivo,
        descripcion_error,
        id_grupo_proceso,
        id_rastro_proceso_superior,
        subprocesos,
        subprocesos_pendientes,
        subprocesos_en_progreso,
        subprocesos_sin_errores,
        subprocesos_con_errores,
        subprocesos_cancelados,
        procedimiento_after_update
        )
    select
        rastro_proceso.id_rastro_proceso,
        rastro_proceso.fecha_hora_inicio_ejecucion,
        rastro_proceso.fecha_hora_fin_ejecucion,
        rastro_proceso.id_usuario,
        midway.current_key_of_funcion(rastro_proceso.id_funcion),
        rastro_proceso.id_recurso,
        rastro_proceso.version_recurso,
        rastro_proceso.codigo_recurso,
        rastro_proceso.nombre_recurso,
        rastro_proceso.id_propietario_recurso,
        rastro_proceso.id_segmento_recurso,
        midway.current_key_of_condicion_eje_fun(rastro_proceso.numero_condicion_eje_fun),
        rastro_proceso.nombre_archivo,
        rastro_proceso.descripcion_error,
        rastro_proceso.id_grupo_proceso,
        rastro_proceso.id_rastro_proceso_superior,
        rastro_proceso.subprocesos,
        rastro_proceso.subprocesos_pendientes,
        rastro_proceso.subprocesos_en_progreso,
        rastro_proceso.subprocesos_sin_errores,
        rastro_proceso.subprocesos_con_errores,
        rastro_proceso.subprocesos_cancelados,
        rastro_proceso.procedimiento_after_update
    from former.rastro_proceso
    order by id_rastro_proceso;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_razon_nodo_indice() returns integer as $$
declare
    rows integer;
begin
    insert into public.razon_nodo_indice
        (
        id,
        version,
        nodo,
        numerador,
        denominador,
        ordinal_razon,
        razon,
        proporcion,
        editable
        )
    select
        razon_nodo_indice.id,
        razon_nodo_indice.version,
        razon_nodo_indice.nodo,
        razon_nodo_indice.numerador,
        razon_nodo_indice.denominador,
        midway.current_key_of_ordinal_razon(razon_nodo_indice.ordinal_razon),
        razon_nodo_indice.razon,
        razon_nodo_indice.proporcion,
        razon_nodo_indice.editable
    from former.razon_nodo_indice
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_recurso_valor() returns integer as $$
declare
    rows integer;
begin
    insert into public.recurso_valor
        (
        id,
        codigo,
        nombre
        )
    select
        recurso_valor.id,
        recurso_valor.codigo,
        recurso_valor.nombre
    from former.recurso_valor
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rol() returns integer as $$
declare
    rows integer;
begin
    insert into public.rol
        (
        id_rol,
        version_rol,
        codigo_rol,
        nombre_rol,
        descripcion_rol,
        es_super_rol,
        es_rol_especial,
        numero_tipo_rol
        )
    select
        rol.id_rol,
        rol.version_rol,
        rol.codigo_rol,
        rol.nombre_rol,
        rol.descripcion_rol,
        rol.es_super_rol,
        rol.es_rol_especial,
        midway.current_key_of_tipo_rol(rol.numero_tipo_rol)
    from former.rol
    where id_rol>10000
    order by id_rol;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rol_filtro_funcion() returns integer as $$
declare
    rows integer;
begin
    insert into public.rol_filtro_funcion
        (
        id_rol_filtro_funcion,
        version_rol_filtro_funcion,
        id_rol,
        id_filtro_funcion
        )
    select
        rol_filtro_funcion.id_rol_filtro_funcion,
        rol_filtro_funcion.version_rol_filtro_funcion,
        rol_filtro_funcion.id_rol,
        rol_filtro_funcion.id_filtro_funcion
    from former.rol_filtro_funcion
    where id_rol>10000
    order by id_rol_filtro_funcion;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rol_funcion() returns integer as $$
declare
    rows integer;
begin
    insert into public.rol_funcion
        (
        id_rol_funcion,
        version_rol_funcion,
        id_rol,
        id_funcion,
        id_conjunto_segmento,
        es_acceso_personalizado,
        es_tarea
        )
    select
        rol_funcion.id_rol_funcion,
        rol_funcion.version_rol_funcion,
        rol_funcion.id_rol,
        midway.current_key_of_funcion(rol_funcion.id_funcion),
        rol_funcion.id_conjunto_segmento,
        rol_funcion.es_acceso_personalizado,
        rol_funcion.es_tarea
    from former.rol_funcion
    where id_rol>10000
    order by id_rol_funcion;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rol_funcion_par() returns integer as $$
declare
    rows integer;
begin
    insert into public.rol_funcion_par
        (
        id_rol_funcion_par,
        version_rol_funcion_par,
        id_rol_funcion,
        id_funcion_parametro
        )
    select
        rol_funcion_par.id_rol_funcion_par,
        rol_funcion_par.version_rol_funcion_par,
        rol_funcion_par.id_rol_funcion,
        midway.current_key_of_funcion_parametro(rol_funcion_par.id_funcion_parametro)
    from former.rol_funcion_par
    inner join former.rol_funcion on rol_funcion.id_rol_funcion = rol_funcion_par.id_rol_funcion
    where id_rol>10000
    order by id_rol_funcion_par;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rol_pagina() returns integer as $$
declare
    rows integer;
begin
    insert into public.rol_pagina
        (
        id_rol_pagina,
        version_rol_pagina,
        id_rol,
        id_pagina
        )
    select
        rol_pagina.id_rol_pagina,
        rol_pagina.version_rol_pagina,
        rol_pagina.id_rol,
        midway.current_key_of_pagina(rol_pagina.id_pagina)
    from former.rol_pagina
    where id_rol>10000
    order by id_rol_pagina;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_rol_usuario() returns integer as $$
declare
    rows integer;
begin
    insert into public.rol_usuario
        (
        id_rol_usuario,
        version_rol_usuario,
        id_rol,
        id_usuario
        )
    select
        rol_usuario.id_rol_usuario,
        rol_usuario.version_rol_usuario,
        rol_usuario.id_rol,
        rol_usuario.id_usuario
    from former.rol_usuario
    where id_usuario>10000
    order by id_rol_usuario;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_segmento() returns integer as $$
declare
    rows integer;
begin
    insert into public.segmento
        (
        id_segmento,
        codigo_segmento,
        nombre_segmento
        )
    select
        segmento.id_segmento,
        segmento.codigo_segmento,
        segmento.nombre_segmento
    from former.segmento
    order by id_segmento;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_tarea_usuario() returns integer as $$
declare
    rows integer;
begin
    insert into public.tarea_usuario
        (
        id,
        version,
        tarea,
        destinatario,
        funcion,
        id_clase_recurso_valor,
        recurso_valor,
        id_recurso_valor,
        codigo_recurso_valor,
        nombre_recurso_valor,
        responsable,
        supervisor,
        finalizador,
        condicion,
        fecha_hora_condicion,
        fecha_hora_asignacion,
        fecha_hora_abandono,
        fecha_hora_registro,
        fecha_hora_limite,
        prioridad,
        pagina_funcion,
        pagina_recurso
        )
    select
        tarea_usuario.id,
        tarea_usuario.version,
        tarea_usuario.tarea,
        tarea_usuario.destinatario,
        midway.current_key_of_funcion(tarea_usuario.funcion),
        tarea_usuario.id_clase_recurso_valor,
        tarea_usuario.recurso_valor,
        tarea_usuario.id_recurso_valor,
        tarea_usuario.codigo_recurso_valor,
        tarea_usuario.nombre_recurso_valor,
        tarea_usuario.responsable,
        tarea_usuario.supervisor,
        tarea_usuario.finalizador,
        midway.current_key_of_condicion_tarea(tarea_usuario.condicion),
        tarea_usuario.fecha_hora_condicion,
        tarea_usuario.fecha_hora_asignacion,
        tarea_usuario.fecha_hora_abandono,
        tarea_usuario.fecha_hora_registro,
        tarea_usuario.fecha_hora_limite,
        tarea_usuario.prioridad,
        tarea_usuario.pagina_funcion,
        tarea_usuario.pagina_recurso
    from former.tarea_usuario
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_usuario() returns integer as $$
declare
    rows integer;
begin
    insert into public.usuario
        (
        id_usuario,
        version_usuario,
        codigo_usuario,
        nombre_usuario,
        password_usuario,
        correo_electronico,
        es_super_usuario,
        es_usuario_especial,
        es_usuario_inactivo,
        es_usuario_modificado,
        id_usuario_supervisor
        )
    select
        usuario.id_usuario,
        usuario.version_usuario,
        usuario.codigo_usuario,
        usuario.nombre_usuario,
        usuario.password_usuario,
        usuario.correo_electronico,
        usuario.es_super_usuario,
        usuario.es_usuario_especial,
        usuario.es_usuario_inactivo,
        usuario.es_usuario_modificado,
        usuario.id_usuario_supervisor
    from former.usuario
    where id_usuario>10000
    order by id_usuario;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_valor_nodo_indice() returns integer as $$
declare
    rows integer;
begin
    insert into public.valor_nodo_indice
        (
        id,
        version,
        medicion,
        nodo,
        tipo_nodo,
        superior,
        peso,
        fecha_valor,
        rango,
        numeral_rango,
        brecha_norma1,
        indice_norma1,
        color_norma1,
        indice_norma2,
        color_norma2,
        frecuencia1,
        frecuencia2,
        frecuencia3,
        frecuencia4,
        frecuencia5,
        frecuencia6,
        frecuencia7,
        frecuencia8,
        frecuencia9,
        respuestas,
        rangos,
        comentarios
        )
    select
        valor_nodo_indice.id,
        valor_nodo_indice.version,
        valor_nodo_indice.medicion,
        valor_nodo_indice.nodo,
        midway.current_key_of_tipo_nodo(valor_nodo_indice.tipo_nodo),
        valor_nodo_indice.superior,
        valor_nodo_indice.peso,
        valor_nodo_indice.fecha_valor,
        valor_nodo_indice.rango,
        valor_nodo_indice.numeral_rango,
        valor_nodo_indice.brecha_norma1,
        valor_nodo_indice.indice_norma1,
        valor_nodo_indice.color_norma1,
        valor_nodo_indice.indice_norma2,
        valor_nodo_indice.color_norma2,
        valor_nodo_indice.frecuencia1,
        valor_nodo_indice.frecuencia2,
        valor_nodo_indice.frecuencia3,
        valor_nodo_indice.frecuencia4,
        valor_nodo_indice.frecuencia5,
        valor_nodo_indice.frecuencia6,
        valor_nodo_indice.frecuencia7,
        valor_nodo_indice.frecuencia8,
        valor_nodo_indice.frecuencia9,
        valor_nodo_indice.respuestas,
        valor_nodo_indice.rangos,
        valor_nodo_indice.comentarios
    from former.valor_nodo_indice
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select_variable() returns integer as $$
declare
    rows integer;
begin
    insert into public.variable
        (
        id,
        version,
        codigo,
        nombre,
        rango_minimo,
        rango_maximo
        )
    select
        variable.id,
        variable.version,
        variable.codigo,
        variable.nombre,
        variable.rango_minimo,
        variable.rango_maximo
    from former.variable
    order by id;
    /**/
    get diagnostics rows = row_count;
    return rows;
end;
$$ language plpgsql;

create or replace function midway.insert_select() returns void as $$
declare
    rows integer;
begin
    raise notice 'insert select';
    perform public.create_defaults();
    perform public.drop_foreign_keys();
    alter table public.ambiente_prueba disable trigger user;
    rows := midway.insert_select_ambiente_prueba();
    alter table public.ambiente_prueba enable trigger user;
    raise notice 'insert select ambiente_prueba % rows', rows;
    alter table public.archivo_adjunto disable trigger user;
    rows := midway.insert_select_archivo_adjunto();
    alter table public.archivo_adjunto enable trigger user;
    raise notice 'insert select archivo_adjunto % rows', rows;
    alter table public.caso_prueba disable trigger user;
    rows := midway.insert_select_caso_prueba();
    alter table public.caso_prueba enable trigger user;
    raise notice 'insert select caso_prueba % rows', rows;
    alter table public.color_indice disable trigger user;
    rows := midway.insert_select_color_indice();
    alter table public.color_indice enable trigger user;
    raise notice 'insert select color_indice % rows', rows;
    alter table public.color_nodo_indice disable trigger user;
    rows := midway.insert_select_color_nodo_indice();
    alter table public.color_nodo_indice enable trigger user;
    raise notice 'insert select color_nodo_indice % rows', rows;
    alter table public.conjunto_segmento disable trigger user;
    rows := midway.insert_select_conjunto_segmento();
    alter table public.conjunto_segmento enable trigger user;
    raise notice 'insert select conjunto_segmento % rows', rows;
    alter table public.documento_prueba disable trigger user;
    rows := midway.insert_select_documento_prueba();
    alter table public.documento_prueba enable trigger user;
    raise notice 'insert select documento_prueba % rows', rows;
    alter table public.ejecucion_linea_prueba disable trigger user;
    rows := midway.insert_select_ejecucion_linea_prueba();
    alter table public.ejecucion_linea_prueba enable trigger user;
    raise notice 'insert select ejecucion_linea_prueba % rows', rows;
    alter table public.ejecucion_prueba disable trigger user;
    rows := midway.insert_select_ejecucion_prueba();
    alter table public.ejecucion_prueba enable trigger user;
    raise notice 'insert select ejecucion_prueba % rows', rows;
    alter table public.elemento_segmento disable trigger user;
    rows := midway.insert_select_elemento_segmento();
    alter table public.elemento_segmento enable trigger user;
    raise notice 'insert select elemento_segmento % rows', rows;
    alter table public.escenario_prueba disable trigger user;
    rows := midway.insert_select_escenario_prueba();
    alter table public.escenario_prueba enable trigger user;
    raise notice 'insert select escenario_prueba % rows', rows;
    alter table public.fila_matriz_razon disable trigger user;
    rows := midway.insert_select_fila_matriz_razon();
    alter table public.fila_matriz_razon enable trigger user;
    raise notice 'insert select fila_matriz_razon % rows', rows;
    alter table public.filtro_funcion disable trigger user;
    rows := midway.insert_select_filtro_funcion();
    alter table public.filtro_funcion enable trigger user;
    raise notice 'insert select filtro_funcion % rows', rows;
    alter table public.filtro_funcion_par disable trigger user;
    rows := midway.insert_select_filtro_funcion_par();
    alter table public.filtro_funcion_par enable trigger user;
    raise notice 'insert select filtro_funcion_par % rows', rows;
    alter table public.linea_prueba disable trigger user;
    rows := midway.insert_select_linea_prueba();
    alter table public.linea_prueba enable trigger user;
    raise notice 'insert select linea_prueba % rows', rows;
    alter table public.medicion_nodo disable trigger user;
    rows := midway.insert_select_medicion_nodo();
    alter table public.medicion_nodo enable trigger user;
    raise notice 'insert select medicion_nodo % rows', rows;
    alter table public.medicion_rama disable trigger user;
    rows := midway.insert_select_medicion_rama();
    alter table public.medicion_rama enable trigger user;
    raise notice 'insert select medicion_rama % rows', rows;
    alter table public.medicion_variable disable trigger user;
    rows := midway.insert_select_medicion_variable();
    alter table public.medicion_variable enable trigger user;
    raise notice 'insert select medicion_variable % rows', rows;
    alter table public.nodo_indice disable trigger user;
    rows := midway.insert_select_nodo_indice();
    alter table public.nodo_indice enable trigger user;
    raise notice 'insert select nodo_indice % rows', rows;
    alter table public.pagina_usuario disable trigger user;
    rows := midway.insert_select_pagina_usuario();
    alter table public.pagina_usuario enable trigger user;
    raise notice 'insert select pagina_usuario % rows', rows;
    alter table public.paquete_prueba disable trigger user;
    rows := midway.insert_select_paquete_prueba();
    alter table public.paquete_prueba enable trigger user;
    raise notice 'insert select paquete_prueba % rows', rows;
    alter table public.parametro_linea_prueba disable trigger user;
    rows := midway.insert_select_parametro_linea_prueba();
    alter table public.parametro_linea_prueba enable trigger user;
    raise notice 'insert select parametro_linea_prueba % rows', rows;
    alter table public.parte_ambiente_prueba disable trigger user;
    rows := midway.insert_select_parte_ambiente_prueba();
    alter table public.parte_ambiente_prueba enable trigger user;
    raise notice 'insert select parte_ambiente_prueba % rows', rows;
    alter table public.pieza_ambiente_prueba disable trigger user;
    rows := midway.insert_select_pieza_ambiente_prueba();
    alter table public.pieza_ambiente_prueba enable trigger user;
    raise notice 'insert select pieza_ambiente_prueba % rows', rows;
    alter table public.programa_prueba disable trigger user;
    rows := midway.insert_select_programa_prueba();
    alter table public.programa_prueba enable trigger user;
    raise notice 'insert select programa_prueba % rows', rows;
    alter table public.rango_variable disable trigger user;
    rows := midway.insert_select_rango_variable();
    alter table public.rango_variable enable trigger user;
    raise notice 'insert select rango_variable % rows', rows;
    alter table public.rastro_funcion disable trigger user;
    rows := midway.insert_select_rastro_funcion();
    alter table public.rastro_funcion enable trigger user;
    raise notice 'insert select rastro_funcion % rows', rows;
    alter table public.rastro_funcion_par disable trigger user;
    rows := midway.insert_select_rastro_funcion_par();
    alter table public.rastro_funcion_par enable trigger user;
    raise notice 'insert select rastro_funcion_par % rows', rows;
    alter table public.rastro_informe disable trigger user;
    rows := midway.insert_select_rastro_informe();
    alter table public.rastro_informe enable trigger user;
    raise notice 'insert select rastro_informe % rows', rows;
    alter table public.rastro_proceso disable trigger user;
    rows := midway.insert_select_rastro_proceso();
    alter table public.rastro_proceso enable trigger user;
    raise notice 'insert select rastro_proceso % rows', rows;
    alter table public.razon_nodo_indice disable trigger user;
    rows := midway.insert_select_razon_nodo_indice();
    alter table public.razon_nodo_indice enable trigger user;
    raise notice 'insert select razon_nodo_indice % rows', rows;
    alter table public.recurso_valor disable trigger user;
    rows := midway.insert_select_recurso_valor();
    alter table public.recurso_valor enable trigger user;
    raise notice 'insert select recurso_valor % rows', rows;
    alter table public.rol disable trigger user;
    rows := midway.insert_select_rol();
    alter table public.rol enable trigger user;
    raise notice 'insert select rol % rows', rows;
    alter table public.rol_filtro_funcion disable trigger user;
    rows := midway.insert_select_rol_filtro_funcion();
    alter table public.rol_filtro_funcion enable trigger user;
    raise notice 'insert select rol_filtro_funcion % rows', rows;
    alter table public.rol_funcion disable trigger user;
    rows := midway.insert_select_rol_funcion();
    alter table public.rol_funcion enable trigger user;
    raise notice 'insert select rol_funcion % rows', rows;
    alter table public.rol_funcion_par disable trigger user;
    rows := midway.insert_select_rol_funcion_par();
    alter table public.rol_funcion_par enable trigger user;
    raise notice 'insert select rol_funcion_par % rows', rows;
    alter table public.rol_pagina disable trigger user;
    rows := midway.insert_select_rol_pagina();
    alter table public.rol_pagina enable trigger user;
    raise notice 'insert select rol_pagina % rows', rows;
    alter table public.rol_usuario disable trigger user;
    rows := midway.insert_select_rol_usuario();
    alter table public.rol_usuario enable trigger user;
    raise notice 'insert select rol_usuario % rows', rows;
    alter table public.segmento disable trigger user;
    rows := midway.insert_select_segmento();
    alter table public.segmento enable trigger user;
    raise notice 'insert select segmento % rows', rows;
    alter table public.tarea_usuario disable trigger user;
    rows := midway.insert_select_tarea_usuario();
    alter table public.tarea_usuario enable trigger user;
    raise notice 'insert select tarea_usuario % rows', rows;
    alter table public.usuario disable trigger user;
    rows := midway.insert_select_usuario();
    alter table public.usuario enable trigger user;
    raise notice 'insert select usuario % rows', rows;
    alter table public.valor_nodo_indice disable trigger user;
    rows := midway.insert_select_valor_nodo_indice();
    alter table public.valor_nodo_indice enable trigger user;
    raise notice 'insert select valor_nodo_indice % rows', rows;
    alter table public.variable disable trigger user;
    rows := midway.insert_select_variable();
    alter table public.variable enable trigger user;
    raise notice 'insert select variable % rows', rows;
    perform public.drop_defaults();
    perform public.create_foreign_keys();
end;
$$ language plpgsql;
