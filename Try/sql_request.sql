/* Start Get Data*/


select id from sis_estimulos.concurso where agno=2019; --convocatoria_id
select estimulo_id from sis_estimulos.concurso where convocatoria_id=?; --estimulo_id
select id from sis_estimulos.convocatoria_documento where convocatoria_id=?;--convocatoria_doc_id
select id from sis_estimulos.propuesta where estimulo_id=?; --propuesta_id
select id from sis_estimulos.propuesta_requisito where propuesta_id=?;--propuesta_requisito_id
select nombre_archivo from sis_estimulos.propuesta_requisito_arch where propuesta_requisito_id=?;--lista de archivos a eliminar
select id from sis_estimulos.verificacion where propuesta_id=?;--veridicacion_id=?
select id from sis_estimulos.subsanacion where propuesta_id=?;--subsanacion_id=?
select id from sis_estimulos.subsanacion_requisito where subsanacion_id=?;--subsanacion_requisito_id=?


/* Start Clean proccess*/
delete from sis_estimulos.subsanacion_req_arch_his where subsanacion_requisito_id=?;
delete from sis_estimulos.subsanacion_requisito where subsanacion_id=?;
delete from sis_estimulos.subsanacion where propuesta_id=?;


delete from sis_estimulos.verificacion_requisito where veficacion_id=?;
delete from sis_estimulos.verificacion where propuesta_id=?;


delete from sis_estimulos.propuesta_requisito_url where propuesta_requisito_id=?;
delete from sis_estimulos.propuesta_requisito_arch where propuesta_requisito_id=?;
delete from sis_estimulos.propuesta_requisito where propuesta_id=?;
delete from sis_estimulos.propuesta_miembro_junta where propuesta_id=?;
delete from sis_estimulos.propuesta_menor_edad where propuesta_id=?;
delete from sis_estimulos.propuesta_medio_conv where propuesta=?;
delete from sis_estimulos.propuesta_jurado_notificacion where propuesta=?;
delete from sis_estimulos.propuesta where estimulo_id=?;


--hasta aqui se tienen solo las propuestas

--delete from sis_estimulos.site_general_ver where ???;
--delete from sis_estimulos.site_general where ???;
delete from sis_estimulos.site_evaluacion where estimulo_id=?;
delete from sis_estimulos.site_estimulo_tipo_part where estimulo_id=?;
delete from sis_estimulos.site_estimulo_bolsa_var where estimulo_id=?;
delete from sis_estimulos.site_estimulo where estimulo_id=?;
delete from sis_estimulos.site_doc_tecnica where estimulo_id=?;
delete from sis_estimulos.site_cronograma where estimulo_id=?;
delete from sis_estimulos.site_convocatoria_doc where convocatoria_doc_id=?; --ir a convocatoria_doc
delete from sis_estimulos.site_convocatoria where estimulo_id=?;
delete from sis_estimulos.site_categoria where estimulo_id=?;


delete from sis_estimulos.convocatoria_documento where convocatoria_id=?;-- enrealidad es concurso_id

delete from sis_estimulos.estimulo_tipo_concursante where estimulo_id=?;
delete from sis_estimulos.estimulo_requisito where estimulo_id=?;
delete from sis_estimulos.estimulo_evento where estimulo_id=?;
delete from sis_estimulos.estimulo_criterio_eval where estimulo_id=?;
delete from sis_estimulos.estimulo_bolsa_variable where estimulo_id=?;
delete from sis_estimulos.estimulo where id=?;-- este lo sacamos de select estimulo_id concurso where agno=2019

delete from sis_estimulos.concurso where agno=2019;

-- propuesta_secuencia where estimulo_id=?;