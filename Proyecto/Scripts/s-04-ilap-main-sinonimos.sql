--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     Validar sinonimos en cada nodo

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinonimos para emcbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-04-ilap-emc-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para emcbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-04-ilap-emc-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para dalbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@dalbdd_s1
@s-04-ilap-dal-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para dalbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@dalbdd_s2
@s-04-ilap-dal-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

Prompt Listo!
