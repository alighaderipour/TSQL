"""
There are two types of attributes in Python namely instance attribute and class attribute.
"""


class Employee:
   name = "Bhavesh Aggarwal"
   age = "30"

# instance of the class
emp = Employee()
# accessing class attributes
print("Name of the Employee:", emp.name)
print("Age of the Employee:", emp.age)

print('Modifying class attributes👇')
# Modifying class attributes
class Employee2:
   # class attribute    
   empCount = 0
   def __init__(self, name, age):
      self.__name = name
      self.__age = age
      # modifying class attribute
      Employee2.empCount += 1
      print ("Name:", self.__name, ", Age: ", self.__age)
      # accessing class attribute
      print ("Employee Count:", Employee2.empCount)

e1 = Employee2("Bhavana", 24)
print()
e2 = Employee2("Rajesh", 26)

print('Access Built-In Class Attributes👇') 
# Access Built-In Class Attributes
class Employee3:
   def __init__(self, name="Bhavana", age=24):
      self.name = name
      self.age = age
   def displayEmployee(self):
      print ("Name : ", self.name, ", age: ", self.age)

print ("Employee3._doc__:", Employee.__doc__)
print ("Employee3._name__:", Employee.__name__)
print ("Employee3._module__:", Employee.__module__)
print ("Employee3._bases__:", Employee.__bases__)
print ("Employee3._dict__:", Employee.__dict__ )
