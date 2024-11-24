##------------------------------------------------------------------------
##local variable | global variable
##------------------------------------------------------------------------
x=10 # this is a global variable
##------------------------------------------------------------------------
def localpune():
    x=20 # this is a local variable inside the function
    print("..this is the value of local vairable..",x)
localpune()
print("..this is a global variable..",x)
##------------------------------------------------------------------------
####..this is the value of local vairable.. 20
####..this is a global variable.. 10
##------------------------------------------------------------------------
##------------------------------------------------------------------------
