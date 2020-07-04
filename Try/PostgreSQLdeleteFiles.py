"""
https://www.postgresqltutorial.com/postgresql-python/query/
https://towardsdatascience.com/python-and-postgresql-how-to-access-a-postgresql-database-like-a-data-scientist-b5a9c5a0ea43
https://www.postgresqltutorial.com/postgresql-python/query/

"""
import psycopg2
import pandas as pd


try:
   connection = psycopg2.connect(user="postgres",
                                  password="sapp12345",
                                  host="192.168.1.14",
                                  port="5432",
                                  database="convocatorias")
   cursor = connection.cursor()
  #postgreSQL_select_Query = "select * from sis_estimulos.usuario"
   postgreSQL_select_Query = "select * from sis_estimulos.propuesta"
   postgreSQL_select_Query = "select * from sis_estimulos.site_convocatoria"
   #aqui estan los archivos y los nobres
   postgreSQL_select_Query = "select * from sis_estimulos.propuesta_requisito_arch"

   cursor.execute(postgreSQL_select_Query)
   table = pd.read_sql_query(postgreSQL_select_Query, connection)
   
   propuesta = pd.read_sql_query("select * from sis_estimulos.propuesta", connection)
   site_convocatoria = pd.read_sql_query("select * from sis_estimulos.site_convocatoria", connection)
   propuesta_requisito_arch = pd.read_sql_query("select * from sis_estimulos.propuesta_requisito_arch", connection)

except (Exception, psycopg2.Error) as error :
    print ("Error while fetching data from PostgreSQL", error)

finally:
    #closing database connection.
    if(connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
