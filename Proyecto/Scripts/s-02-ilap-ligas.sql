--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  17/10/2021
--@Descripción:     Creación de ligas

clear screen
whenever sqlerror exit rollback
Prompt ============================
Prompt Creando ligas en emcbdd_s1
Prompt ============================

connect ilap_bdd/ilap_bdd@emcbdd_s1
--PDB local
create database link emcbdd_s2.fi.unam using 'EMCBDD_S2';
--PDB remotas
create database link dalbdd_s1.fi.unam using 'DALBDD_S1';
create database link dalbdd_s2.fi.unam using 'DALBDD_S2';

Prompt ============================
Prompt Creando ligas en emcbdd_s2
Prompt ============================

connect ilap_bdd/ilap_bdd@emcbdd_s2
--PDB local
create database link emcbdd_s1.fi.unam using 'EMCBDD_S1';
--PDB remotas
create database link dalbdd_s1.fi.unam using 'DALBDD_S1';
create database link dalbdd_s2.fi.unam using 'DALBDD_S2';

Prompt ============================
Prompt Creando ligas en dalbdd_s1
Prompt ============================

connect ilap_bdd/ilap_bdd@dalbdd_s1
--PDB local
create database link dalbdd_s2.fi.unam using 'DALBDD_S2';
--PDB remotas
create database link emcbdd_s1.fi.unam using 'EMCBDD_S1';
create database link emcbdd_s2.fi.unam using 'EMCBDD_S2';

Prompt ============================
Prompt Creando ligas en dalbdd_s2
Prompt ============================

connect ilap_bdd/ilap_bdd@dalbdd_s2
--PDB local
create database link dalbdd_s1.fi.unam using 'DALBDD_S1';
--PDB remotas
create database link emcbdd_s1.fi.unam using 'EMCBDD_S1';
create database link emcbdd_s2.fi.unam using 'EMCBDD_S2';

Prompt Listo!