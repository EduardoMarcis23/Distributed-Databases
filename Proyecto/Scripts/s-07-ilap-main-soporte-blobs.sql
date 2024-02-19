--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Configuracion de base en cada nodo

Prompt configurando directorios y otorgando registros.

--emcbdd_s1
Prompt configurando soporte BLOB para emcbdd_s1
connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

--emcbdd_s2
Prompt configurando soporte BLOB para emcbdd_s2
connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

--dalbdd_s1
Prompt configurando soporte BLOB para dalbdd_s1
connect ilap_bdd/ilap_bdd@dalbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

--dalbdd_s2
Prompt configurando soporte BLOB para dalbdd_s2
connect ilap_bdd/ilap_bdd@dalbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt Listo !