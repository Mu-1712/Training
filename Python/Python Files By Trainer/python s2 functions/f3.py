##-----------------------------------------------------------------------
# Function definition is here
##-----------------------------------------------------------------------
def f3( mylist ):
   "This changes a passed list into this function"
   mylist = [1,2,3,4]; # This would assig new reference in mylist
   print ("Values inside the function: ", mylist)
   return
##-----------------------------------------------------------------------
# Now you can call f3 function
##-----------------------------------------------------------------------
mylist = [10,20,30];
f3( mylist );
print ("Values outside the function: ", mylist)
##-----------------------------------------------------------------------
##Values inside the function:  [1, 2, 3, 4]
##Values outside the function:  [10, 20, 30]
##-----------------------------------------------------------------------
##-----------------------------------------------------------------------
