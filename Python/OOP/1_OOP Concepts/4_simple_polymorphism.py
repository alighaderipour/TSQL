# define parent class
class Parent:        
   def myMethod(self):
      print ("Calling parent method")

# define child class
class Child(Parent): 
   def myMethod(self):
      print ("Calling child method")

# instance of child
c = Child()
# child calls overridden method          
c.myMethod()            