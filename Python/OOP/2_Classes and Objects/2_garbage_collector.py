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