class Cloth:
   cloth_price = 400

   @classmethod
   def showPrice(cls):
      return cls.cloth_price

print(Cloth.cloth_price)

# printing class attribute without any instansiation