#--------------------------------------------------------------------------
# issubclass()
#--------------------------------------------------------------------------
class Animal:
#--------------------------------------------------------------------------
    def walk(self):
        print("animal walking")
#--------------------------------------------------------------------------
class Cat(Animal):
#--------------------------------------------------------------------------
    def talk(self):
        print("cat talking mhew")
#--------------------------------------------------------------------------
x=Cat()
print(issubclass(Cat,Animal))
print(issubclass(Animal,Cat))
#--------------------------------------------------------------------------
##True
##False
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
