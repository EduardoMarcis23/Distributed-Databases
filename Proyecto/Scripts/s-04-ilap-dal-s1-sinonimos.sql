--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     Sinonimos nodo F3

--Sucursal
create or replace synonym sucursal_f1 for sucursal_f1_emc_s1@emcbdd_s1;
create or replace synonym sucursal_f2 for sucursal_f2_emc_s2@emcbdd_s2;
create or replace synonym sucursal_f3 for sucursal_f3_dal_s1;
create or replace synonym sucursal_f4 for sucursal_f4_dal_s2@dalbdd_s2;

--Sucursal Taller
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_emc_s1@emcbdd_s1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_emc_s2@emcbdd_s2;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_dal_s1;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_dal_s2@dalbdd_s2;

--Sucursal Venta
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_emc_s1@emcbdd_s1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_emc_s2@emcbdd_s2;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_dal_s1;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_dal_s2@dalbdd_s2;

--Tipo Procesador
create or replace synonym tipo_procesador_r1 for tipo_procesador_r_emc_s1@emcbdd_s1;
create or replace synonym tipo_procesador_r2 for tipo_procesador_r_emc_s2@emcbdd_s2;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r_dal_s1;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r_dal_s2@dalbdd_s2;

--Tipo Tarjeta Video
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r_emc_s1@emcbdd_s1;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r_emc_s2@emcbdd_s2;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r_dal_s1;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r_dal_s2@dalbdd_s2;

--Tipo Almacenamiento
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r_emc_s1@emcbdd_s1;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r_emc_s2@emcbdd_s2;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r_dal_s1;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r_dal_s2@dalbdd_s2;

--Tipo Monitor
create or replace synonym tipo_monitor_r1 for tipo_monitor_r_emc_s1@emcbdd_s1;
create or replace synonym tipo_monitor_r2 for tipo_monitor_r_emc_s2@emcbdd_s2;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r_dal_s1;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r_dal_s2@dalbdd_s2;

--Laptop
create or replace synonym laptop_f1 for laptop_f1_dal_s2@dalbdd_s2;
create or replace synonym laptop_f2 for laptop_f2_emc_s1@emcbdd_s1;
create or replace synonym laptop_f3 for laptop_f3_emc_s2@emcbdd_s2;
create or replace synonym laptop_f4 for laptop_f4_dal_s1;
create or replace synonym laptop_f5 for laptop_f5_dal_s2@dalbdd_s2;

--Laptop Inventario
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_emc_s1@emcbdd_s1;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f3_dal_s1;

--Servicio Laptop
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_emc_s1@emcbdd_s1;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_emc_s2@emcbdd_s2;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_dal_s1;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_dal_s2@dalbdd_s2;

--Status Laptop
--create or replace synonym status_laptop for status_laptop@emcbdd_s1;
--create or replace synonym status_laptop for status_laptop@emcbdd_s2;
--create or replace synonym status_laptop for status_laptop;
--create or replace synonym status_laptop for status_laptop@dalbdd_s2;

--Historio Status Laptop
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_emc_s1@emcbdd_s1;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_emc_s2@emcbdd_s2;