  
#!/bin/bash
#

User=app_convocatorias
Passw=Convoc4*Med*
DataB=convocatorias
ipAddr=10.2.0.47

#Local
#User=postgres
#Passw=sapp12345
#DataB=convocatorias
#ipAddr=192.168.1.14

echo ''
echo 'DataBase Cleanup'
#echo 'run Script for conv ${1} ============================================================' >> CleanDB.log

# Primera parte ============================================================

filename='subsanacion_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.subsanacion_requisito where subsanacion_id=${k}" >> CleanDB.log
 PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.subsanacion where id=${k}" >> CleanDB.log

    n=$((n+1))
  fi
done < $filename

#filename='subsanacion_requisito_id.txt'
filename='propuesta_requisito_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.subsanacion_req_arch_his where subsanacion_requisito=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.subsanacion_req_arch_his where propuesta_requisito=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion_requisito where propuesta_requisito_id=${k}" >> CleanDB.log
    n=$((n+1))
  fi
done < $filename
<< 'MULTILINE-COMMENT'
#filename='propuesta_id.txt'
filename='verificacion_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.subsanacion where propuesta_id=${k}" >> CleanDB.log
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.subsanacion where verificacion_id=${k}" >> CleanDB.log
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion where id=${k}" >> CleanDB.log 
    n=$((n+1))
  fi
done < $filename
MULTILINE-COMMENT
# Segunda parte ============================================================
filename='propuesta_id.txt'
#filename='verificacion_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion_requisito where verificacion_id=${k}" >> CleanDB.log
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion_requisito where propuesta_id=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion where propuesta_id=${k}" >> CleanDB.log
    n=$((n+1))
  fi
done < $filename
<< 'MULTILINE-COMMENT'
#filename='propuesta_id.txt'
filename='verificacion_id_2.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion where id=${k}" >> CleanDB.log
    n=$((n+1))
  fi
done < $filename
MULTILINE-COMMENT
# Tercera parte ============================================================

filename='propuesta_requisito_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_requisito_url where propuesta_requisito_id=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_requisito_arch where propuesta_requisito_id=${k}" >> CleanDB.log
    n=$((n+1))
  fi
done < $filename

filename='propuesta_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    #PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.verificacion where propuesta_id=${k}" >> CleanDB.log 
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_miembro_junta where propuesta_id=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_menor_edad where propuesta_id=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_medio_conv where propuesta=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_jurado_notificacion where propuesta=${k}" >> CleanDB.log
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta_requisito where propuesta_id=${k}" >> CleanDB.log
    n=$((n+1))
	fi
  n=$((n+1))
done < $filename

filename='estimulo_id.txt'
n=1
while read line; do
	k="$(echo $line | cut -d'|' -f1)"
   if [ -z $k ];then
    n=$((n+1))
  else
    PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "delete from sis_estimulos.propuesta where estimulo_id=${k}" >> CleanDB.log
    n=$((n+1))
  fi
done < $filename

# Cuarta parte ============================================================

echo 'DataBase Cleanup Ends'
#echo '============================================================'
