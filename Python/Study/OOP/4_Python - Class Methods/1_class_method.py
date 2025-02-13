"""
We can divide Python methods in three different categories, 
which are class method, instance method and static method
"""
class Employee:
    emCount =0
    def __init__(self,name, age):
        self.name = name
        self.age = age
        Employee.emCount +=1

    def showcount(self):
      print (self.emCount)
    
    counter = classmethod(showcount)

e1 = Employee("Bhavana", 24)
e2 = Employee("Rajesh", 26)
e3 = Employee("John", 27)

e1.showcount()
Employee.counter()


# using @staticmethod
class Student:
   stdCount = 0
   def __init__(self, name, age):
      self.__name = name
      self.__age = age
      Student.stdCount += 1
   
   # creating staticmethod
   @staticmethod
   def showcount():
      print (Student.stdCount)

e1 = Student("Bhavana", 24)
e2 = Student("Rajesh", 26)
e3 = Student("John", 27)


e1.showcount()
Student.showcount()
