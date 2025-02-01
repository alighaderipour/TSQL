# https://realpython.com/python3-object-oriented-programming/?spm=5aebb161.1b0c161.0.0.7dfd5171uyg1jG
class Employee:
    def __init__(self, name, age):
        self.name =  name
        self.age = age

e1 = Employee("Ali" , 31)
print(e1.name)
print(e1.age)