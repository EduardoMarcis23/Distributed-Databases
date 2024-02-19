--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Trigger para framentos de sucursal

create or replace trigger t_dml_sucursal
instead of insert or delete on sucursal
declare
begin

	case
		when inserting then
			if (:new.es_taller = 1 and :new.es_venta = 1 and (substr(:new.clave,3,2) = 'NO' or substr(:new.clave,3,2) = 'EA' or substr(:new.clave,3,2) = 'WS' or substr(:new.clave,3,2) = 'SO'))
				or (:new.es_taller = 0 or :new.es_venta = 0 and substr(:new.clave,3,2) = 'NO') then
				insert into sucursal_f1(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
				values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);
			
			elsif (:new.es_taller = 0 or :new.es_venta = 0) and substr(:new.clave,3,2) = 'EA' then
				insert into sucursal_f2(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
				values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

			elsif (:new.es_taller = 0 or :new.es_venta = 0) and substr(:new.clave,3,2) = 'WS' then
				insert into sucursal_f3(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
				values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

			elsif (:new.es_taller = 0 or :new.es_venta = 0) and substr(:new.clave,3,2) = 'SO' then
				insert into sucursal_f4(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
				values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

			else
				raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');

			end if;



----------------------------------ELIMINACION--------------------------------------

		when deleting then
			if (:old.es_taller = 1 and :old.es_venta = 1) or substr(:old.clave,3,2) = 'NO' then
				delete from sucursal_f1 where sucursal_id = :old.sucursal_id;

			elsif (:old.es_taller = 0 or :old.es_venta = 0) and substr(:old.clave,3,2) = 'EA' then
				delete from sucursal_f2 where sucursal_id  = :old.sucursal_id;

			elsif (:old.es_taller = 0 or :old.es_venta = 0) and substr(:old.clave,3,2) = 'WS' then
				delete from sucursal_f3 where sucursal_id  = :old.sucursal_id;

			elsif (:old.es_taller = 0 or :old.es_venta = 0) and substr(:old.clave,3,2) = 'SO' then
				delete from sucursal_f4 where sucursal_id  = :old.sucursal_id;

			else
				raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');

			end if;
	end case; 
end;
/