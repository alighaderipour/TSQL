"""
Name mangling is the process of changing name of a member 
with double underscore to the form object._class__variable.
obj._class__privatevar
"""
class Employee2:
   def __init__(self, name, age, salary):
      self.name = name # public variable
      self.__age = age # private variable
      self._salary = salary # protected variable
   def displayEmployee(self):
      print ("Name : ", self.name, ", age: ", self.__age, ", salary: ", self._salary)

e1=Employee2("Bhavana", 24, 10000)

print (e1.name)
print (e1._salary)
print(e1._Employee2__age)