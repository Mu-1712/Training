##-----------------------------------------------------------------------
# Function definition is here
##-----------------------------------------------------------------------
def f7( name, age = 18 ):
   "This prints a passed info into this function"
   print ("Name: ", name)
   print ("Age: ", age)
   return;
##-----------------------------------------------------------------------
##-----------------------------------------------------------------------
f7( age=24, name="anil" )
f7( name="sunil" )
##-----------------------------------------------------------------------
##Name:  anil
##Age:  24
##Name:  sunil
##Age:  18
##-----------------------------------------------------------------------
##-----------------------------------------------------------------------