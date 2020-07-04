#!/bin/bash
#

#PGPASSWORD=$(echo $password) psql -h example.com -U example_user -d example_db -t -c "select * from example_table1" -o example_out.txt 
#psql -U postgres -d database_name -c "SELECT c_defaults  FROM user_info WHERE c_uid = 'testuser'"

#Dev
#User=app_convocatorias
#Passw=Convoc4*Med*
#DataB=convocatorias
#ipAddr=10.2.0.47

#Local
User=postgres
Passw=sapp12345
DataB=convocatorias
ipAddr=127.0.0.1

PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select * from sis_estimulos.usuario" -o SisUsuario.txt
PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select * from sis_estimulos.propuesta" -o SisPropuesta.txt
PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select * from sis_estimulos.site_convocatoria" -o SisSiteConv.txt
PGPASSWORD=$Passw psql -h $ipAddr -U $User -d $DataB -t -c "select * from sis_estimulos.propuesta_requisito_arch" -o SisPropRequi.txt

#PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.usuario" -o SisUsuario.txt
#PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.propuesta" -o SisPropuesta.txt
#PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.site_convocatoria" -o SisSiteConv.txt
#PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.propuesta_requisito_arch" -o SisPropRequi.txt

