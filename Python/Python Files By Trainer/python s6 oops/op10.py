#--------------------------------------------------------------------------
# inheritance
#--------------------------------------------------------------------------
class Animal:
#--------------------------------------------------------------------------
    def walk(self):
        print("animal walking")
#--------------------------------------------------------------------------
class Dog(Animal):  # dog class is called as child class
#--------------------------------------------------------------------------
    def talk(self):
        print("dog barking")
#--------------------------------------------------------------------------
x=Dog()
x.talk()
x.walk()
y=Animal()
y.walk()
#--------------------------------------------------------------------------
##dog barking
##animal walking
##animal walking
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
