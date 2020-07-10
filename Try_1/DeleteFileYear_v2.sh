
#!/bin/bash
#

#Local
User=postgres
Passw=sapp12345
DataB=convocatorias
ipAddr=192.168.1.14

#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.concurso where agno='2019'" -o convocatoria_id.txt 


 
 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_id,id from sis_estimulos.propuesta_requisito" -o propuesta_requisito_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_requisito_id,nombre_archivo from sis_estimulos.propuesta_requisito_arch" -o files.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_id,id from sis_estimulos.verificacion" -o veridicacion_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_id,id from sis_estimulos.subsanacion" -o subsanacion_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select subsanacion_id,id from sis_estimulos.subsanacion_requisito" -o subsanacion_requisito_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select * from sis_estimulos.usuario" -o SisUsuario.txt

filename='estimulo_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  echo "$k"
  PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.propuesta where estimulo_id=$k" -o propuesta_id.txt
	n=$((n+1))
done < $filename




#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.concurso where agno='2019'" -o convocatoria_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select convocatoria_id,estimulo_id from sis_estimulos.site_convocatoria" -o estimulo_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select convocatoria_id,id from sis_estimulos.convocatoria_documento" -o convocatoria_doc_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select estimulo_id,id from sis_estimulos.propuesta" -o propuesta_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_id,id from sis_estimulos.propuesta_requisito" -o propuesta_requisito_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_requisito_id,nombre_archivo from sis_estimulos.propuesta_requisito_arch" -o files.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_id,id from sis_estimulos.verificacion" -o veridicacion_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select propuesta_id,id from sis_estimulos.subsanacion" -o subsanacion_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select subsanacion_id,id from sis_estimulos.subsanacion_requisito" -o subsanacion_requisito_id.txt 
#PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select * from sis_estimulos.usuario" -o SisUsuario.txt



