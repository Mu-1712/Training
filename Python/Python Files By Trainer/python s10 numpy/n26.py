##----------------------------------------------------------------------------
##			numpy.ones
##----------------------------------------------------------------------------
##Returns a new array of specified size and type, filled with ones.
##----------------------------------------------------------------------------
##numpy.ones(shape, dtype = None, order = 'C')
##----------------------------------------------------------------------------
##Sr.No.	Parameter 		Description
##----------------------------------------------------------------------------
##1	Shape	Shape of an empty array in int or tuple of int
##----------------------------------------------------------------------------
##2	Dtype	Desired output data type. Optional
##----------------------------------------------------------------------------
##3	Order	'C' for C-style row-major array, 
##----------------------------------------------------------------------------
##		'F' for FORTRAN style column-major array
##----------------------------------------------------------------------------
# array of five ones. Default dtype is float 
##--------------------------------------------------------------------------
import numpy as np 
##--------------------------------------------------------------------------
x = np.ones(5) 
print (x)
##--------------------------------------------------------------------------
##output
##[1. 1. 1. 1. 1.]
##--------------------------------------------------------------------------
##--------------------------------------------------------------------------








