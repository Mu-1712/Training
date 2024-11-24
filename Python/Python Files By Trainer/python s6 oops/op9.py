#--------------------------------------------------------------------------
# built-in class attributes
#--------------------------------------------------------------------------
class Emp:
#--------------------------------------------------------------------------
    'this is emp doc'
#--------------------------------------------------------------------------
    def __init__(self,eid,ename):
        self.eid=eid
        self.ename=ename
#--------------------------------------------------------------------------
    def display(self):
        print(self.eid)
        print(self.ename)
#--------------------------------------------------------------------------
x=Emp(10,'anil')
print(Emp.__doc__)
print(Emp.__dict__)
print(Emp.__name__)
print(Emp.__module__)
print(Emp.__bases__)
#--------------------------------------------------------------------------
##              this is emp doc
##{'__module__': '__main__', '__doc__': 'this is emp doc', '__init__': <function Emp.__init__ at 0x0000023378DB7910>, 'display': <function Emp.display at 0x0000023378DB79A0>, '__dict__': <attribute '__dict__' of 'Emp' objects>, '__weakref__': <attribute '__weakref__' of 'Emp' objects>}
##Emp
##__main__
##(<class 'object'>,)
#--------------------------------------------------------------------------




