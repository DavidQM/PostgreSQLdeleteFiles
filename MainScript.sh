#!/bin/bash

#Produccion
#User=app_convoca
#Passw=M3dconvoc4*
#DataB=convocatorias
#ipAddr=10.1.222.187

#Desarrollo 
User=app_convocatorias
Passw=Convoc4*Med*
DataB=convocatorias
ipAddr=10.2.0.47

# Se genera primer consulta
#Local
echo "MainScript"
#User=postgres
#Passw=sapp12345
#DataB=convocatorias
#ipAddr=192.168.1.14

echo 'Build file -> convocatoria_id.txt'
PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.concurso where agno='2019'" -o convocatoria_id.txt 

echo 'Build file -> estimulo_id.txt'
filename='convocatoria_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  if [ -z $k ];then
    n=$((n+1))
  else
    echo "========================================================"
    echo "Convocatoria numero $k"
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select estimulo_id from sis_estimulos.site_convocatoria where convocatoria_id=${k}" -o estimulo_id.txt
    sleep 2
    sh secondScript.sh $k
    n=$((n+1))
  fi
done < $filename

echo 'Build file -> conv_clear_list.txt'
filename='convocatoria_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  #echo "$k"
  if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select estimulo_id,agno,nombre from sis_estimulos.concurso where id=${k}" >> conv_clear_list.txt
    n=$((n+1))
  fi
done < $filename

sleep 2
python2.7 SearchDelete.py

sleep 2
echo 'remove residual data'

#eliminamos todos los files
rm propuesta_id.txt
rm estimulo_id.txt
rm convocatoria_id.txt


