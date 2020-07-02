#!/bin/bash
#

#PGPASSWORD=$(echo $password) psql -h example.com -U example_user -d example_db -t -c "select * from example_table1" -o example_out.txt 
#psql -U postgres -d database_name -c "SELECT c_defaults  FROM user_info WHERE c_uid = 'testuser'"

PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.usuario" -o SisUsuario.txt
PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.propuesta" -o SisPropuesta.txt
PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.site_convocatoria" -o SisSiteConv.txt
PGPASSWORD=Convoc4*Med* psql -h 10.2.0.47 -U app_convocatorias -d convocatorias -t -c "select * from sis_estimulos.propuesta_requisito_arch" -o SisPropRequi.txt

