--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Trigger para historico status

create or replace trigger t_dml_historico_status_laptop
instead of insert or delete on historico_status_laptop
declare
	v_count number;
begin
	case
		when inserting then
			if :new.fecha_status >= to_date('2010-01-01','yyyy-mm-dd') then
				insert into historico_status_laptop_f1(historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id)
				values(:new.historico_status_laptop_id,:new.fecha_status,:new.status_laptop_id,:new.laptop_id);

			elsif :new.fecha_status < to_date('2010-01-01','yyyy-mm-dd') then
				insert into historico_status_laptop_f2(historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id)
				values(:new.historico_status_laptop_id,:new.fecha_status,:new.status_laptop_id,:new.laptop_id);

			else
				raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');

			end if;


----------------------------------ELIMINACION--------------------------------------

		when deleting then
			if :old.fecha_status >= to_date('2010-01-01','yyyy-mm-dd') then
				delete from historico_status_laptop_f1 where historico_status_laptop_id = :old.historico_status_laptop_id;

			elsif :old.fecha_status < to_date('2010-01-01','yyyy-mm-dd') then
				delete from historico_status_laptop_f2 where historico_status_laptop_id  = :old.historico_status_laptop_id;

			else
				raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');

			end if;
	end case; 
end;
/