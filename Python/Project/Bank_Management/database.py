# Database Management Banking
import mysql.connector as sql

mydb = sql.connect(
    host = "localhost",
    user = "root",
    password = "Aa@123456",
    database = "Bank"
)

cursor = mydb.cursor()

def db_query(str):
    cursor.execute(str)
    result = cursor.fetchall()
    return result

def create_customer_table():
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS customers
    (username varchar(20),
    password varchar(20),
    name varchar(20),
    age integer,
    city varchar(20),
    account_number integer,
    status boolean
    )

    ''')

mydb.commit()

if __name__ == "__main__":
    create_customer_table()