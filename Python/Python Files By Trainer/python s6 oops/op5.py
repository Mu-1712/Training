#--------------------------------------------------------------------------
# parameterized constructor
#--------------------------------------------------------------------------
class Vehicle1:
#--------------------------------------------------------------------------
    def __init__(self,name):
        self.name=name
        print("parameterized constructor")
        # parameters are passed to the constructor
#--------------------------------------------------------------------------
    def display(self):
        print(self.name)
#--------------------------------------------------------------------------
x=Vehicle1("suzuki")
x.display()
#--------------------------------------------------------------------------
##parameterized constructor
##suzuki
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------