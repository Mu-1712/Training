#--------------------------------------------------------------------------
# Define a function here.
def temp_convert(var):
   try:
      return int(var)
   except ValueError, Argument:
      print ("The argument does not contain numbers\n", Argument)

# Call above function here.
temp_convert("xyz");
#--------------------------------------------------------------------------
#.............not working ....in python 3.7.........
#--------------------------------------------------------------------------