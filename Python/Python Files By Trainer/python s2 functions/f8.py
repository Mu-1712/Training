##------------------------------------------------------------------------
# Function definition is here
##------------------------------------------------------------------------
def f8( arg1, *vartuple ):
   "This prints a variable passed arguments"
   print ("Output is: ")
   print (arg1)
   for var in vartuple:
      print (var)
   return;
##------------------------------------------------------------------------
# Now you can call f8 function
##------------------------------------------------------------------------
f8( 10 )
f8( 70, 60, 50 )
##------------------------------------------------------------------------
##Output is: 
##10
##Output is: 
##70
##60
##50
##------------------------------------------------------------------------
##------------------------------------------------------------------------




