#--------------------------------------------------------------------------
# built-in functions for classes
# getattr() setattr() hasattr() delattr()
#--------------------------------------------------------------------------
class Customer:
#--------------------------------------------------------------------------
    def __init__(self,eid,ename,eage):
        self.eid=eid
        self.ename=ename
        self.eage=eage
#--------------------------------------------------------------------------
x=Customer(10,'anil',24)
print(getattr(x,'eid'))
print(getattr(x,'ename'))
print(getattr(x,'eage'))
setattr(x,'eage',30)
print(getattr(x,'eage'))
print(hasattr(x,'eage'))
delattr(x,'eage')
print(hasattr(x,'eage'))
#--------------------------------------------------------------------------
##10
##anil
##24
##30
##True
##False
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

