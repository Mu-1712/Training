#--------------------------------------------------------------------------
class Employee:
#--------------------------------------------------------------------------
   'Common base class for all employees' # class header
   empCount = 0 # class variable
#--------------------------------------------------------------------------
   def __init__(self, name, salary):
      self.name = name
      self.salary = salary
      Employee.empCount += 1
#--------------------------------------------------------------------------   
   def displayCount(self):
     print ("Total Employee %d" % Employee.empCount)
#--------------------------------------------------------------------------
   def displayEmployee(self):
      print ("Name : ", self.name,  ", Salary: ", self.salary)
#--------------------------------------------------------------------------
"This would create first object of Employee class"
emp1 = Employee("anil", 2000)
"This would create second object of Employee class"
emp2 = Employee("sunil", 5000)
emp1.displayEmployee()
emp2.displayEmployee()
print ("Total Employee %d" % Employee.empCount)
#--------------------------------------------------------------------------
##Name :  anil , Salary:  2000
##Name :  sunil , Salary:  5000
##Total Employee 2
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
