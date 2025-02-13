# Create object <40>
a = 40      
# Increase ref. count  of <40> 
b = a       
# Increase ref. count  of <40> 
c = [b]     

# Decrease ref. count  of <40>
del a       
# Decrease ref. count  of <40>
b = 100      
# Decrease ref. count  of <40>
c[0] = -1    


#Example

class Point:
   def __init__( self, x=0, y=0):
      self.x = x
      self.y = y
   def __del__(self):
      class_name = self.__class__.__name__
      print (class_name, "destroyed")

pt1 = Point()
pt2 = pt1
pt3 = pt1
# prints the ids of the obejcts
print (id(pt1), id(pt2), id(pt3))
del pt1
del pt2
del pt3