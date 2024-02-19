--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Trigger para framentos de laptop con dato lob remoto

create or replace trigger t_dml_laptop
instead of insert or delete on laptop
declare
	v_count number;
begin
	case
		when inserting then
			if :new.num_serie like '0%' or :new.num_serie like '1%' then
				insert into laptop_f2(laptop_id,num_serie,cantidad_ram,caracteristicas_extra,tipo_procesador_id,tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_remplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extra,:new.tipo_procesador_id,:new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_remplazo_id);

			elsif substr(:new.num_serie,1,1) between 6 and 9 then
				insert into laptop_f3(laptop_id,num_serie,cantidad_ram,caracteristicas_extra,tipo_procesador_id,tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_remplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extra,:new.tipo_procesador_id,:new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_remplazo_id);

			elsif :new.num_serie like '4%' or :new.num_serie like '5%' then
				insert into laptop_f4(laptop_id,num_serie,cantidad_ram,caracteristicas_extra,tipo_procesador_id,tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_remplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extra,:new.tipo_procesador_id,:new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_remplazo_id);

			elsif :new.num_serie like '2%' or :new.num_serie like '3%' then
				insert into laptop_f5(laptop_id,num_serie,cantidad_ram,caracteristicas_extra,tipo_procesador_id,tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_remplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extra,:new.tipo_procesador_id,:new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_remplazo_id);
			else
				raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');

			end if;


			--Limpiamos la tabla
			delete from ti_laptop_f1
			where laptop_id = :new.laptop_id;
		
			--inserta el binario, uso de una tabla temporal
			insert into ti_laptop_f1(laptop_id,foto)
			values(:new.laptop_id,:new.foto);

			--inserta en el sitio remoto a través de la tabla temporal
			insert into laptop_f1
				select laptop_id,foto from ti_laptop_f1
				where laptop_id = :new.laptop_id;


----------------------------------ELIMINACION--------------------------------------

		when deleting then
			if :old.num_serie like '0%' or :old.num_serie like '1%' then
				delete from laptop_f2 where laptop_id = :old.laptop_id;

			elsif substr(:old.num_serie,1,1) between 6 and 9 then
				delete from laptop_f3 where laptop_id = :old.laptop_id;

			elsif :old.num_serie like '4%' or :old.num_serie like '5%' then
				delete from laptop_f4 where laptop_id = :old.laptop_id;
				
			elsif :old.num_serie like '2%' or :old.num_serie like '3%' then
				delete from laptop_f5 where laptop_id = :old.laptop_id;

			else
				raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');

			end if;

			delete from laptop_f1
			where laptop_id = :old.laptop_id;

	end case; 
end;
/
show errors