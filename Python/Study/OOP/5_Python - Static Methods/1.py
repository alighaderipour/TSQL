"""
In Python, a static method is a type of method that does not require
any instance to be called. It is very similar to the class method 
but the difference is that the static method doesn't have a mandatory argument
like reference to the object  "self" or reference to the class  "cls".
Static methods are used to access static fields of a given class. They cannot modify 
the state of a class since they are bound to the class, not instance.
"""
class Employee:
    empCount = 0
    def __init__(self, name, age):
        self. name = name
        self.age = age
        Employee.empCount +=1
    
    def showCount():
        print(Employee.empCount) 
    
    counter = staticmethod(showCount)

e1 = Employee("Bhavana", 24)
e2 = Employee("Rajesh", 26)
e3 = Employee("John", 27)

e1.counter()
Employee.counter()