--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Trigger para framentos de sucursal_venta en F3

create or replace trigger t_dml_sucursal_venta
instead of insert or delete on sucursal_venta
declare
	v_count number;
begin
	case
		when inserting then
			--verifica si hay correspondencia local para evitar acceso remoto
			select count(*) into v_count
			from sucursal_f3 where sucursal_id =:new.sucursal_id;

			--insercion local
			if v_count > 0 then
				insert into sucursal_venta_f3(sucursal_id,hora_apertura,hora_cierre)
				values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);

			else
				select count(*) into v_count
				from sucursal_f2 where sucursal_id =:new.sucursal_id;

				if v_count > 0 then
					insert into sucursal_venta_f2(sucursal_id,hora_apertura,hora_cierre)
					values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);

				else
					select count(*) into v_count
					from sucursal_f1 where sucursal_id =:new.sucursal_id;

					if v_count > 0 then
						insert into sucursal_venta_f1(sucursal_id,hora_apertura,hora_cierre)
						values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);

					else 
						select count(*) into v_count
						from sucursal_f4 where sucursal_id =:new.sucursal_id;

						if v_count > 0 then
							insert into sucursal_venta_f4(sucursal_id,hora_apertura,hora_cierre)
							values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);

						else 
							raise_application_error(-20020, 
								'El registro que se intenta insertar o eliminar no cumple con el esquema de  fragmentación horizontal derivada.'); 
						end if;
					end if;
				end if;
			end if;

----------------------------------ELIMINACION--------------------------------------

		when deleting then
			select count(*) into v_count
			from sucursal_f3 where sucursal_id =:old.sucursal_id;

			--borrado local
			if v_count > 0 then
				delete from sucursal_venta_f3 where sucursal_id = :old.sucursal_id;		

			else
				select count(*) into v_count
				from sucursal_f2 where sucursal_id =:old.sucursal_id;

				if v_count > 0 then
					delete from sucursal_venta_f2 where sucursal_id = :old.sucursal_id;

				else
					select count(*) into v_count
					from sucursal_f1 where sucursal_id =:old.sucursal_id;

					if v_count > 0 then
						delete from sucursal_venta_f1 where sucursal_id = :old.sucursal_id;

					else
						select count(*) into v_count
						from sucursal_f4 where sucursal_id =:old.sucursal_id;

						if v_count > 0 then
						delete from sucursal_venta_f4 where sucursal_id = :old.sucursal_id;

						else 
							raise_application_error(-20020, 
								'El registro que se intenta insertar o eliminar no cumple con el esquema de  fragmentación horizontal derivada.'); 

						end if;
					end if;
				end if;
			end if;
	end case;
end;
/