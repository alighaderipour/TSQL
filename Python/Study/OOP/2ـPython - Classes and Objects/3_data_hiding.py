"""
An object's attributes may or may not be visible outside the class definition. 
You need to name attributes with a double underscore prefix "__"
and those attributes then are not be directly visible to outsiders.
"""
class JustCounter:
    __secretCount = 0  # Private variable

    def count(self):
        self.__secretCount += 1
        print(self.__secretCount)  # Corrected print statement

counter = JustCounter()
counter.count()  # Prints: 1
counter.count()  # Prints: 2
print(counter._JustCounter__secretCount)
"""
Python protects those members by internally changing the name to include the class name.
 You can access such attributes as object._className__attrName.
 If you would replace your last line as following, then it works for you 
"""
print(counter.__secretCount)  # Raises AttributeError
