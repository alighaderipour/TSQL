"""
Python's standard library has a built-in property() function. 
It returns a property object. It acts as an interface to the 
instance variables of a Python class.

The encapsulation principle of object-oriented programming requires that 
the instance variables should have a restricted private access. 
Python doesn't have efficient mechanism for the purpose. 
The property() function provides an alternative.

The property() function uses the getter, setter and delete methods 
defined in a class to define a property object for the class.

property(fget=None, fset=None, fdel=None, doc=None)
"""
class Employee:
   def __init__(self, name, age):
      self.__name = name
      self.__age = age

   def get_name(self):
      return self.__name
   def get_age(self):
      return self.__age
   def set_name(self, name):
      self.__name = name
      return
   def set_age(self, age):
      self.__age=age
      return
   name = property(get_name, set_name, "name")
   age = property(get_age, set_age, "age")

e1=Employee("Bhavana", 24)
print ("Name:", e1.name, "age:", e1.age)

e1.name = "Archana"
e1.age = 23
print ("Name:", e1.name, "age:", e1.age)