#--------------------------------------------------------------------------
# del() destructor method
#--------------------------------------------------------------------------
class Point:
#--------------------------------------------------------------------------
    def __init__(self,x=0,y=0):
        self.x=x
        self.y=y
        print("object created")
#--------------------------------------------------------------------------
    def __del__(self):
        print("object destroyed")
#--------------------------------------------------------------------------
p=Point()
print(id(p))
del p
print(id(p))    # error
#--------------------------------------------------------------------------
##object created
##3156645799984
##object destroyed
##Traceback (most recent call last):
##  File "C:/Users/dhanp/OneDrive/python/python/python/python s6 ##oops/op16.py", line 12, in <module>
##    print(id(p))
##NameError: name 'p' is not defined
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------