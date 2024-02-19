--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     DML de nodos


clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para emcbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-03-ilap-emc-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para emcbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-03-ilap-emc-s2-ddl.sql

prompt =====================================
prompt Creando fragmentos para dalbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@dalbdd_s1
@s-03-ilap-dal-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para dalbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@dalbdd_s2
@s-03-ilap-dal-s2-ddl.sql
Prompt Listo!
