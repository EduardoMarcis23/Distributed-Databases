--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     Trigger para monitor

create or replace trigger t_dml_tipo_monitor
	instead of insert or update or delete on tipo_monitor
declare
	v_count number;
begin 
	case
		when inserting then
			v_count := 0;
			--replica local
			insert into tipo_monitor_r1(tipo_monitor_id,clave,descripcion)
			values (:new.tipo_monitor_id,:new.clave,:new.descripcion);
			v_count := v_count + sql%rowcount;

			--replica2
			insert into tipo_monitor_r2(tipo_monitor_id,clave,descripcion)
			values (:new.tipo_monitor_id,:new.clave,:new.descripcion);
			v_count := v_count + sql%rowcount;

			--replica3
			insert into tipo_monitor_r3(tipo_monitor_id,clave,descripcion)
			values (:new.tipo_monitor_id,:new.clave,:new.descripcion);
			v_count := v_count + sql%rowcount;

			--replica4
			insert into tipo_monitor_r4(tipo_monitor_id,clave,descripcion)
			values (:new.tipo_monitor_id,:new.clave,:new.descripcion);
			v_count := v_count + sql%rowcount;

			if v_count <> 4 then
				raise_application_error(-20040,'Número incorrecto de registros insertados en tabla replicada: '||v_count);

			end if;

		when deleting then
			v_count := 0;
			--replica local
			delete from tipo_monitor_r1 
			where tipo_monitor_id = :old.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			--replica 2
			delete from tipo_monitor_r2 
			where tipo_monitor_id = :old.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			--replica3
			delete from tipo_monitor_r3 
			where tipo_monitor_id = :old.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			--replica4
			delete from tipo_monitor_r4
			where tipo_monitor_id = :old.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			if v_count <> 4 then
				raise_application_error(-20040,'Número incorrecto de registros eliminados en tabla replicada: '||v_count);
			end if;

		when updating then
			--replica local
			v_count := 0;
			update tipo_monitor_r1 set clave = :new.clave,descripcion =:new.descripcion
			where tipo_monitor_id = :new.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			--replica 2
			update tipo_monitor_r2 set clave = :new.clave,descripcion =:new.descripcion
			where tipo_monitor_id = :new.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			--replica 3
			update tipo_monitor_r3 set clave = :new.clave,descripcion =:new.descripcion
			where tipo_monitor_id = :new.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			--replica 4
			update tipo_monitor_r4 set clave = :new.clave,descripcion =:new.descripcion
			where tipo_monitor_id = :new.tipo_monitor_id;
			v_count := v_count + sql%rowcount;

			if v_count <> 4 then
				raise_application_error(-20040,'Número incorrecto de registros actualizados en tabla replicada: '||v_count);
			end if;
	end case;
end;
/
show errors
