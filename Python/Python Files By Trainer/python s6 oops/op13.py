#--------------------------------------------------------------------------
# isinstance()
#--------------------------------------------------------------------------
class Animal:
#--------------------------------------------------------------------------
    def walk(self):
        print("walking")
#--------------------------------------------------------------------------
class Dog(Animal):
#--------------------------------------------------------------------------
    def talk(self):
        print("barking")
#--------------------------------------------------------------------------
x=Dog()
print(isinstance(x,Dog))
print(isinstance(x,Animal))
print(isinstance(Dog,x))        # error
#--------------------------------------------------------------------------
##True
##True
##Traceback (most recent call last):
##  File "C:/Users/dhanp/OneDrive/python/python/python/python s6 
## oops/op13.py", line 11, in <module>
##    print(isinstance(Dog,x))
##TypeError: isinstance() arg 2 must be a type, a tuple of types, or a union
##   
#--------------------------------------------------------------------------
#-------------------------------------------------------------------------- 