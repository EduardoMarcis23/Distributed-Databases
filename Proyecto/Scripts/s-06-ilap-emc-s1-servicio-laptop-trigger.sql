--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Trigger para sevicio laptop en F1

create or replace trigger t_dml_servicio_laptop
instead of insert or delete on servicio_laptop
declare
	v_count number;
begin
	case
		when inserting then
			--verifica si hay correspondencia local para evitar acceso remoto
			select count(*) into v_count
			from sucursal_taller_f1 where sucursal_id =:new.sucursal_id;

			--insercion local
			if v_count > 0 then
				insert into servicio_laptop_f1(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
				values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);

			else
				select count(*) into v_count
				from sucursal_taller_f2 where sucursal_id =:new.sucursal_id;

				if v_count > 0 then
					delete from ti_servicio_laptop_f2
					where num_servicio = :new.num_servicio
					and laptop_id = :new.laptop_id;

					insert into ti_servicio_laptop_f2(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
					values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);

					insert into servicio_laptop_f2
					select * from ti_servicio_laptop_f2
					where num_servicio = :new.num_servicio
					and laptop_id = :new.laptop_id;


				else
					select count(*) into v_count
					from sucursal_taller_f3 where sucursal_id =:new.sucursal_id;

					if v_count > 0 then
						delete from ti_servicio_laptop_f3
						where num_servicio = :new.num_servicio
						and laptop_id = :new.laptop_id;

						insert into ti_servicio_laptop_f3(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
						values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);

						insert into servicio_laptop_f3
						select * from ti_servicio_laptop_f3
						where num_servicio = :new.num_servicio
						and laptop_id = :new.laptop_id;

					else 
						select count(*) into v_count
						from sucursal_taller_f4 where sucursal_id =:new.sucursal_id;

						if v_count > 0 then
							delete from ti_servicio_laptop_f4
							where num_servicio = :new.num_servicio
							and laptop_id = :new.laptop_id;

							insert into ti_servicio_laptop_f4(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
							values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);

							insert into servicio_laptop_f4
							select * from ti_servicio_laptop_f4
							where num_servicio = :new.num_servicio
							and laptop_id = :new.laptop_id;

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
			from sucursal_taller_f1 where sucursal_id =:old.sucursal_id;

			--borrado local
			if v_count > 0 then
				delete from servicio_laptop_f1 
				where num_servicio = :old.num_servicio
				and laptop_id = :old.laptop_id;		

			else
				select count(*) into v_count
				from sucursal_taller_f2 where sucursal_id =:old.sucursal_id;

				if v_count > 0 then
					delete from servicio_laptop_f2
					where num_servicio = :old.num_servicio
					and laptop_id = :old.laptop_id;	

				else
					select count(*) into v_count
					from sucursal_taller_f3 where sucursal_id =:old.sucursal_id;

					if v_count > 0 then
						delete from servicio_laptop_f3
						where num_servicio = :old.num_servicio
						and laptop_id = :old.laptop_id;	

					else
						select count(*) into v_count
						from sucursal_taller_f4 where sucursal_id =:old.sucursal_id;

						if v_count > 0 then
						delete from servicio_laptop_f4
						where num_servicio = :old.num_servicio
						and laptop_id = :old.laptop_id;

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
show errors