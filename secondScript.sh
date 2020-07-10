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
#echo "SecondScript"
#User=postgres
#Passw=sapp12345
#DataB=convocatorias
#ipAddr=192.168.1.14

echo "Build file -> propuesta_id.txt"
filename='estimulo_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  #echo "$k"
  if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.propuesta where estimulo_id=${k}" -o propuesta_id.txt
    n=$((n+1))
	fi

done < $filename

#echo "Build file -> propuesta_requisito_id.txt"
filename='propuesta_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
  if [ -z $k ];then
    n=$((n+1))
  else
    echo "_________________________________________"
    echo "Propuesta -> ${k}"
    echo "Build file -> propuesta_requisito_id.txt"
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.propuesta_requisito where propuesta_id=${k}" -o propuesta_requisito_id.txt
    echo "Build file -> verificacion_id.txt"
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.verificacion where propuesta_id=${k}" -o verificacion_id.txt
    echo "Build file -> subsanacion_id.txt" 
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select id from sis_estimulos.subsanacion where propuesta_id=${k}" -o subsanacion_id.txt
    #sleep 2
    sh threeScript.sh $1
    rm propuesta_requisito_id.txt
    rm verificacion_id.txt
    rm subsanacion_id.txt
    #rm subsanacion_requisito_id.txt
    n=$((n+1))
  fi 
done < $filename

