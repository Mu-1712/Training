#--------------------------------------------------------------------------
# setAttr() getAttr()
#--------------------------------------------------------------------------
class Parent:
#--------------------------------------------------------------------------
    parentAttr=100
#--------------------------------------------------------------------------
    def __init__(self):
        print("parent constructor")
#--------------------------------------------------------------------------
    def parentMethod(self):
        print("parent method")
#--------------------------------------------------------------------------
    def setAttr(self,x):
        Parent.parentAttr=x
#--------------------------------------------------------------------------
    def getAttr(self):
        print(Parent.parentAttr)
#--------------------------------------------------------------------------
class Child(Parent):
#--------------------------------------------------------------------------
    def __init__(self):
        print("child constructor")
#--------------------------------------------------------------------------
    def childMethod(self):
        print("child method")
#--------------------------------------------------------------------------
x=Child()
x.childMethod()
x.parentMethod()
x.setAttr(10)
x.getAttr()
#--------------------------------------------------------------------------
##child constructor
##child method
##parent method
##10
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------




        