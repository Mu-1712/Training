##-----------------------------------------------------------------------
total = 0; # This is global variable.
##-----------------------------------------------------------------------
# Function definition is here
##-----------------------------------------------------------------------
def sum123( arg1, arg2 ):
   # Add both the parameters and return them."
   total = arg1 + arg2; # Here total is local variable.
   print ("Inside the function local total : ", total)
   return total;
##-----------------------------------------------------------------------
# Now you can call sum123 function
##-----------------------------------------------------------------------
sum123( 10, 20 );
print ("Outside the function global total : ", total )
##-----------------------------------------------------------------------
##Inside the function local total :  30
##Outside the function global total :  0
##-----------------------------------------------------------------------
##-----------------------------------------------------------------------
