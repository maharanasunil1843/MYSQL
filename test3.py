import mysql.connector as connection

mydb = connection.connect(host = "localhost", user = "root", passwd = "Sunil131096@")
cursor = mydb.cursor()
cursor.execute("select company, name from sunil.sunil_details")
for i in cursor.fetchall(): #fetches each row in a tuple form
    print(i, type(i))