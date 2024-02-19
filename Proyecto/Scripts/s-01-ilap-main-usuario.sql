--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  07/01/2021
--@Descripción:     Creación de usuarios para para cada PBD 

Prompt  Inciando creacion/eliminacion de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide

prompt =====================================
prompt Creando usuario en emcbdd_s1
prompt =====================================

connect sys/&&syspass@emcbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en emcbdd_s2
prompt =====================================

connect sys/&&syspass@emcbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en dalbdd_s1
prompt =====================================

connect sys/&&syspass@dalbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en dalbdd_s2
prompt =====================================

connect sys/&&syspass@dalbdd_s2 as sysdba
@s-01-ilap-usuario.sql