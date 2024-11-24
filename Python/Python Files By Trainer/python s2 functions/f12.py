##------------------------------------------------------------------------
x=20 # this is a global variable
def calculate():
    global x # global is a keyword used to refer the global variable
    x=x+1
    print("inside the function ",x)
    
print("before the function is called  ",x)
calculate()
print("after the function is called ",x)
##------------------------------------------------------------------------
##before the function is called   20
##inside the function  21
##after the function is called  21
##------------------------------------------------------------------------
##------------------------------------------------------------------------
