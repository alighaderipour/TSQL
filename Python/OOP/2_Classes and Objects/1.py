"""
class ClassName:
   'Optional class documentation string'
   class_suite

The class has a documentation string, which can be accessed via ClassName.__doc__.

The class_suite consists of all the component statements defining class members,
data attributes and functions.
"""
class Employee:
    'common base class for all employees'
    empCount = 0
    def __init__(self, name, salary):
        self.emp_name = name
        self.emp_salary = salary
        self.empCount +=1
    def displayCount(self):
        return f'total number of employees are {self.empCount}'
    def displayEmployee(self):
        return f'Employee Name is {self.emp_name} with salary {self.emp_salary}'
emp = Employee('Ali', 123456789)
print(emp.displayCount())
print(emp.displayEmployee())
"""
The variable empCount is a class variable whose value is shared among all instances of 
a this class. This can be accessed as Employee.empCount from inside the class or outside the class.

The first method __init__() is a special method, which is called class constructor 
or initialization method that Python calls when you create a new instance of this class.

You declare other class methods like normal functions with the exception that
the first argument to each method is self. Python adds the self argument to the list for you; you do not need to include it when you call the methods.
"""
print ("Employee.__doc__:", Employee.__doc__)
print ("Employee.__name__:", Employee.__name__)
print ("Employee.__module__:", Employee.__module__)
print ("Employee.__bases__:", Employee.__bases__)
print ("Employee.__dict__:", Employee.__dict__)