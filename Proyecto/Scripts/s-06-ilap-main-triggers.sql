--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     Creacion de Triggers

clear screen
whenever sqlerror exit rollback

Prompt ==============================
Prompt Creando triggers en emcbdd_s1
Prompt ==============================

connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-emc-s1-sucursal-taller-trigger.sql
@s-06-ilap-emc-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-emc-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en emcbdd_s2
Prompt ==============================

connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-emc-s2-sucursal-taller-trigger.sql
@s-06-ilap-emc-s2-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-emc-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en dalbdd_s1
Prompt ==============================

connect ilap_bdd/ilap_bdd@dalbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-dal-s1-sucursal-taller-trigger.sql
@s-06-ilap-dal-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-dal-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en dalbdd_s2
Prompt ==============================

connect ilap_bdd/ilap_bdd@dalbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-dal-s2-sucursal-taller-trigger.sql
@s-06-ilap-dal-s2-sucursal-venta-trigger.sql
@s-06-ilap-dal-s2-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-dal-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt Listo!