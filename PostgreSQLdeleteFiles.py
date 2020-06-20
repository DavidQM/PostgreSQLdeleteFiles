import psycopg2

try:
   connection = psycopg2.connect(user="postgres",
                                  password="sapp12345",
                                  host="192.168.1.14",
                                  port="5432",
                                  database="convocatorias")
   cursor = connection.cursor()
   postgreSQL_select_Query = "select * from sis_estimulos.usuario"

   cursor.execute(postgreSQL_select_Query)
   print("Selecting rows from mobile table using cursor.fetchall")
   mobile_records = cursor.fetchall() 
   
   print("Print each row and it's columns values")
   for row in mobile_records:
       print(row)
       #print("Id = ", row[0], )
       #print("Model = ", row[1])
       #print("Price  = ", row[2], "\n")

except (Exception, psycopg2.Error) as error :
    print ("Error while fetching data from PostgreSQL", error)

finally:
    #closing database connection.
    if(connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")