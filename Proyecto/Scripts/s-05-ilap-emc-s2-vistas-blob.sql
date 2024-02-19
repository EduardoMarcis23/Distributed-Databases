--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  10/01/2021
--@Descripción:     Vistas con datos LOB en F2

create or replace view laptop as
	select laptop_id,num_serie,cantidad_ram,caracteristicas_extra,
		tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
		tipo_monitor_id,laptop_remplazo_id, get_remote_foto_f1_by_id(laptop_id) foto 
	from
	(
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extra,
			tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
			tipo_monitor_id,laptop_remplazo_id 
		from laptop_f2
		union all
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extra,
			tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
			tipo_monitor_id,laptop_remplazo_id
		from laptop_f3
		union all
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extra,
			tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
			tipo_monitor_id,laptop_remplazo_id
		from laptop_f4
		union 
		select laptop_id,num_serie,cantidad_ram,caracteristicas_extra,
			tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
			tipo_monitor_id,laptop_remplazo_id
		from laptop_f5
	) q1;

create or replace view servicio_laptop as
	select num_servicio,laptop_id,importe,diagnostico,
		get_remote_serv_lap_f1_by_id(num_servicio,laptop_id) factura,sucursal_id
	from servicio_laptop_f1
	union  all
	select num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
	from servicio_laptop_f2 
	union all
	select num_servicio,laptop_id,importe,diagnostico,
		get_remote_serv_lap_f3_by_id(num_servicio,laptop_id) factura,sucursal_id
	from servicio_laptop_f3 
	union all
	select num_servicio,laptop_id,importe,diagnostico,
		get_remote_serv_lap_f4_by_id(num_servicio,laptop_id) factura,sucursal_id
	from servicio_laptop_f4;