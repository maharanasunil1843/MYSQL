import mysql.connector as connection

mydb = connection.connect(host = "localhost", user = "root", passwd = "Sunil131096@")
cursor = mydb.cursor()
cursor.execute("insert into sunil.personal values(121, 'maharanasunil1843')")
cursor.execute("insert into sunil.personal values(122, 'maharanasunil5')")
cursor.execute("insert into sunil.personal values(123, 'astrophysicist4')")
mydb.commit()
cursor.execute("select * from sunil.personal")
for i in cursor.fetchall():
    print(i)
