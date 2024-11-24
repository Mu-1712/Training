##------------------------------------------------------------------------
##to access a global variable inside the function 
##.. use of the keyword global
a=10
def localpune():
    global a # this tells the sysem that it is a global variable
    print("..the value inside the function..",a)

localpune()
print("..the value outside the function..",a)
##------------------------------------------------------------------------
##..the value inside the function.. 10
##..the value outside the function.. 10
##------------------------------------------------------------------------
# to check whether the global variable can be modified inside the function
##------------------------------------------------------------------------
##a=10
##def localpune():
##    global a # this tells the sysem that it is a global variable
##    a=20 # the global variable is modified inside the function
##    print("..the value inside the function..",a)

##localpune()
##print("..the value outside the function..",a)
##------------------------------------------------------------------------
##..the value inside the function.. 20
##..the value outside the function.. 20
##------------------------------------------------------------------------
##------------------------------------------------------------------------








