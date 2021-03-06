#!/bin/bash
#
User=app_convocatorias
Passw=Convoc4*Med*
DataB=convocatorias
ipAddr=10.2.0.47

# Se genera segunda consulta
#Local
#echo "threeScript"
#User=postgres
#Passw=sapp12345
#DataB=convocatorias
#ipAddr=192.168.1.14

echo "Build file -> propuesta_requisito_id.txt"
filename='propuesta_requisito_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  #echo "$k"
  if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select nombre_archivo from sis_estimulos.propuesta_requisito_arch where propuesta_requisito_id=${k}" >> files.txt
	fi 
done < $filename

echo "Build file -> subsanacion_id.txt"
filename='subsanacion_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  #echo "$k"
  if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.subsanacion_requisito where subsanacion_id=${k}" -o subsanacion_requisito_id.txt 
  fi
done < $filename

#sleep 2
#sh ClearDB.sh $1
