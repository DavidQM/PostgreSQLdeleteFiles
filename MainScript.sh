#!/bin/bash
#

# Se genera primer consulta
#Local
echo "MainScript"
User=postgres
Passw=sapp12345
DataB=convocatorias
ipAddr=192.168.1.14

PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.concurso where agno='2019'" -o convocatoria_id.txt 

echo 'Build file -> convocatoria_id.txt'
filename='convocatoria_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  echo "Convocatoria numero $k"
  if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select estimulo_id from sis_estimulos.site_convocatoria where convocatoria_id=${k}" -o estimulo_id.txt
    sleep 2
    sh secondScript.sh $k
    n=$((n+1))
  fi
done < $filename

echo 'Build file -> conv_remove_list.txt'
filename='convocatoria_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  #echo "$k"
  if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select estimulo_id,agno,nombre from sis_estimulos.concurso where id=${k}" >> conv_remove_list.txt
    n=$((n+1))
  fi
done < $filename

echo 'remove residual data'
#eliminamos todos los files
rm verificacion_id.txt
rm subsanacion_requisito_id.txt
rm subsanacion_id.txt
rm propuesta_requisito_id.txt
rm propuesta_id.txt
rm estimulo_id.txt
rm convocatoria_id.txt



