--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Trigger para framentos de laptop con dato lob local

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
declare
	v_count number;
	v_count_aux number;

begin
	case
		when inserting then
			--verifica si hay correspondencia local para evitar acceso remoto
			select count(*) into v_count
			from status_laptop where status_laptop_id =:new.status_laptop_id;

			--insercion local
			if v_count > 0 then
				insert into laptop_inventario_f1(laptop_id,fecha_status,sucursal_id,status_laptop_id)
				values(:new.laptop_id,:new.fecha_status,:new.sucursal_id,:new.status_laptop_id);

				insert into laptop_inventario_f2(laptop_id,rfc_cliente,num_tarjeta)
				values(:new.laptop_id,:new.rfc_cliente,:new.num_tarjeta);

			else 
				raise_application_error(-20020, 
					'El registro que se intenta insertar o eliminar no cumple con el esquema de  fragmentación horizontal derivada.'); 

			end if;



----------------------------------ELIMINACION--------------------------------------

		when deleting then
			select count(*) into v_count
			from laptop_inventario_f1 where laptop_id =:old.laptop_id;

			select count(*) into v_count_aux
			from laptop_inventario_f2 where laptop_id =:old.laptop_id;

			--borrado local
			if v_count > 0 and v_count_aux > 0 then
				delete from laptop_inventario_f1 where laptop_id = :old.laptop_id;
				delete from laptop_inventario_f2 where laptop_id = :old.laptop_id;

			else
				raise_application_error(-20020, 
					'El registro que se intenta insertar o eliminar no cumple con el esquema de  fragmentación horizontal derivada.'); 

			end if;

	end case;
end;
/
show errors