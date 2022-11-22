import mysql.connector as connection

mydb = connection.connect(host= "localhost", user = "root", passwd = "Sunil131096@")
cursor = mydb.cursor()
#s = "insert into sunil.sunil_details values(115, 'sunil maharana', 200000, 'google')"
#cursor.execute(s)
#mydb.commit()
cursor.execute("select * from sunil.sunil_details")
for i in cursor.fetchall():
    print(i)


