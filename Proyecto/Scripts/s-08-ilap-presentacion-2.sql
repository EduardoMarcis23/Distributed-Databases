--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Carga Status


clear screen
whenever sqlerror exit rollback;
--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1

Prompt ======================================
Prompt Cargando catalogos de forma manual en emcbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@emcbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando catalogos de forma manual en emcbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@emcbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando catalogos de forma manual en dalbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@dalbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando catalogos de forma manual en dalbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@dalbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Listo!
exit