--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     Creacion de Vistas sin datos LOB

--sucursal
create or replace view sucursal as 
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f1
union all
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f2
union all
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f3
union all
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f4;

--Sucursal Taller
create or replace view sucursal_taller as 
select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f1
union all
select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f2
union all
select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f3
union all
select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f4;

--Sucursal Venta
create or replace view sucursal_venta as 
select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f1
union all
select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f2
union all
select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f3
union all
select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f4;

--Tipo Procesador
create or replace view tipo_procesador as 
select tipo_procesador_id,clave,descripcion from tipo_procesador_r1;

--Tipo Tarjeta Video
create or replace view tipo_tarjeta_video as 
	select tipo_tarjeta_video_id,clave,descripcion from tipo_tarjeta_video_r1;

--Tipo Almacenamiento
create or replace view tipo_almacenamiento as 
select tipo_almacenamiento_id,clave,descripcion from tipo_almacenamiento_r1;

--Tipo Monitor
create or replace view tipo_monitor as
	select tipo_monitor_id,clave,descripcion from tipo_monitor_r1;

--Laptop
/*
create or replace view tipo_procesador as 
	select l1.laptop_id,l1.num_serie,l1.cantidad_ram,l1.caracteristicas_extras,l4.foto,l1.tipo_tarjeta_procesador,
		l1.tipo_tarjeta_video_id,l1.tipo_almacenamiento_id,l1.tipo_monitor,l1.laptop_remplazo_id
	from 
	(
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_procesador,
			tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor,laptop_remplazo_id
		from laptop_f1
		union all
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_procesador,
			tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor,laptop_remplazo_id
		from laptop_f2
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_procesador,
			tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor,laptop_remplazo_id
		from laptop_f3
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_procesador,
			tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor,laptop_remplazo_id
		from laptop_f4
	) l1
	join
	(
		select laptop_id,foto
		from laptop_f4
	) l4
	on l1.laptop_id = l4.laptop_id;
*/

--Laptop Inventario
create or replace view laptop_inventario as
	select li1.laptop_id, li1.fecha_status, li3.rfc_cliente, li3.num_tarjeta,
		li1.sucursal_id, li1.status_laptop_id
	from laptop_inventario_f1 li1
	join laptop_inventario_f2 li3
	on li1.laptop_id = li3.laptop_id;

--Status Laptop


--Historio Status Laptop
create or replace view historico_status_laptop as 
select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id from historico_status_laptop_f1
union all
select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id from historico_status_laptop_f2;