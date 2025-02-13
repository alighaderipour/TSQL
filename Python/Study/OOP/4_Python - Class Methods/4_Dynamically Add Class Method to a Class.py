"""
Dynamically Add Class Method to a Class
"""
class Cloth:
   pass

# class method
@classmethod
def brandName(cls):
   print("Name of the brand is Raymond")

# adding dynamically
setattr(Cloth, "brand_name", brandName)
newObj = Cloth()
newObj.brand_name()



# Dynamically Delete Class Methods
class Cloth:
   # class method
   @classmethod
   def brandName(cls):
      print("Name of the brand is Raymond")

# deleting dynamically
del Cloth.brandName
print("Method deleted")