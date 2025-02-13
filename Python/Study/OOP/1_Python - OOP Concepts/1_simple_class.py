# defining class
class Smartphone:
   # constructor    
   def __init__(self, device_input, brand_star):
      self.device = device_input
      self.brand = brand_star
   
   # method of the class
   def description(self):
      return f"{self.device} of {self.brand} supports Android 14"

# creating object of the class
phoneObj = Smartphone("Smartphone", "Samsung")
print(phoneObj.description()) 