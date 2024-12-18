##----------------------------------------------------------------------------
##			numpy.itemsize
##----------------------------------------------------------------------------
##This array attribute returns the length of each element of array in bytes.
##----------------------------------------------------------------------------
# dtype of array is int8 (1 byte)
##-------------------------------------------------------------------------- 
import numpy as np 
##--------------------------------------------------------------------------
x = np.array([1,2,3,4,5], dtype = np.int8) 
print (x.itemsize)
##--------------------------------------------------------------------------
##output
##1
##--------------------------------------------------------------------------
##--------------------------------------------------------------------------
