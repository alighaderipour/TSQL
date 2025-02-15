# Python - Instance Methods
"""
In addition to the __init__() constructor, there may be one or more instance methods
defined in a class. A method with self as one of the formal
arguments is called instance method, as it is called by a specific object.
"""
class Employee:
   def __init__(self, name="Bhavana", age=24):
      self.name = name
      self.age = age
   def displayEmployee(self):
      print ("Name : ", self.name, ", age: ", self.age)

e1 = Employee()
e2 = Employee("Bharat", 25)

e1.displayEmployee()
e2.displayEmployee()