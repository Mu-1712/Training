#--------------------------------------------------------------------------
class Employee:
#--------------------------------------------------------------------------
    def __init__(self,empid,empname):
        self.empid=empid
        self.empname=empname
#--------------------------------------------------------------------------
    def displayEmp(self):
        print(self.empid)
        print(self.empname)
#--------------------------------------------------------------------------
emp1=Employee(10,'anil')
emp2=Employee(20,'sunil')
emp1.displayEmp()
emp2.displayEmp()
#--------------------------------------------------------------------------
##10
##anil
##20
##sunil
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
