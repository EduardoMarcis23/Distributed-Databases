--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  07/01/2021
--@Descripción:     Creación de usuario

declare
	v_count number(1,0);
begin
	select count(*) into v_count from dba_users
	where lower(username) ='ilap_bdd';

	if v_count >0 then
		execute immediate 'drop user ilap_bdd cascade';

	else dbms_output.put_line('El usuario ilap_bdd no existe');

	end if;

end;
/

Prompt Creando al usuario ilap_bdd
--Completa
create user ilap_bdd identified by ilap_bdd 
	default tablespace users
	quota unlimited on users;

grant create session, create table, create procedure, 
	create sequence, create trigger, create view, create synonym,
	create database link, create public database link, create any directory
to ilap_bdd;
