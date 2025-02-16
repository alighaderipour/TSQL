# customer details
class customer:
    def __init__(self,username, passsword, name, age, city, account_number):
        self.__username = username
        self.__password = passsword
        self.__name = name
        self.__age = age
        self.__city = city
        self.__account_number = account_number

    def create_user(self):
        temp = db_query(f"insert into customers(username,password,name,age,city,account_number) values ('{self.__username}', '{self.__password}','{self.__age}','{self.__age}','{self.__city}','{self.__account_number}')")
        mydb.commit()