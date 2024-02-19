--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Creacion de vistas para todos los sitios

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando vistas para emcbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@emcbdd_s1
prompt  creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando  objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-emc-s1-vistas-blob.sql

prompt =====================================
prompt Creando vistas para emcbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@emcbdd_s2
prompt  creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando  objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-emc-s2-vistas-blob.sql

prompt =====================================
prompt Creando vistas para dalbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@dalbdd_s1
prompt  creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando  objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-dal-s1-vistas-blob.sql

prompt =====================================
prompt Creando vistas para dalbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@dalbdd_s2
prompt  creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando  objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-dal-s2-vistas-blob.sql

Prompt Listo!
disconnect