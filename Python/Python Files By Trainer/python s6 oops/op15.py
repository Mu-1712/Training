#--------------------------------------------------------------------------
# method over riding
#--------------------------------------------------------------------------
class Parent:
#--------------------------------------------------------------------------
    def myMethod(self):
        print("parent")
#--------------------------------------------------------------------------
class Child(Parent):
#--------------------------------------------------------------------------
    def myMethod(self):
        print("child")
#--------------------------------------------------------------------------
x=Child()
x.myMethod()
y=Parent()
y.myMethod()
#--------------------------------------------------------------------------
##child
##parent
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------