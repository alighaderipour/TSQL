"""
Single Inheritance
Multiple Inheritance
Multilevel Inheritance
Hierarchical Inheritance
Hybrid Inheritance
"""
# Simple Inheritance

class Parent: 
   def parentMethod(self):
      print ("Calling parent method")

class Child(Parent): 
   def childMethod(self):
      print ("Calling child method")

# instance of Child class
c = Child()  

c.childMethod() 
c.parentMethod() 


# Multiple Inheritance
class Division:
   def __init__(self, a,b):
      self.n=a
      self.d=b
   def divide(self):
      return self.n/self.d
class Modules:
   def __init__(self, a,b):
      self.n=a
      self.d=b
   def mod_divide(self):
      return self.n%self.d
      
class DivMod(Division,Modules):
   def __init__(self, a,b):
      self.n=a
      self.d=b
   def div_and_mod(self):
      divval=Division.divide(self)
      modval=Modules.mod_divide(self)
      return (divval, modval)

x=DivMod(10,3)
print ("division:",x.divide())
print ("mod_division:",x.mod_divide())
print ("divmod:",x.div_and_mod())