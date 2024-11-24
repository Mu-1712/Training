##----------------------------------------------------------------------------
##Data Type Objects (dtype)
##----------------------------------------------------------------------------
##A data type object describes interpretation of fixed block of memory 
##corresponding to an array, depending on the following aspects :
##----------------------------------------------------------------------------
##1.	Type of data (integer, float or Python object)
##----------------------------------------------------------------------------
##2.	Size of data
##----------------------------------------------------------------------------
##3.	Byte order (little-endian or big-endian)
##----------------------------------------------------------------------------
##The byte order is decided by prefixing '<' or '>' to data type. '<' means 
##that encoding is little-endian (least significant is stored in smallest 
##address). '>' means that encoding is big-endian (most significant byte is 
##stored in smallest address)
##----------------------------------------------------------------------------
##numpy.dtype(object, align, copy)
##----------------------------------------------------------------------------
##The parameters are :
##----------------------------------------------------------------------------
##1.	Object - To be converted to data type object
##----------------------------------------------------------------------------
##2.	Align - If true, adds padding to the field to make it similar to 
##		C-struct
##----------------------------------------------------------------------------
##3.	Copy - Makes a new copy of dtype object. 
##----------------------------------------------------------------------------
##		If false, the result is reference to builtin data type 
##		object
##----------------------------------------------------------------------------
# using array-scalar type 
##--------------------------------------------------------------------------
import numpy as np 
##--------------------------------------------------------------------------
dt = np.dtype(np.int32) 
print (dt)
##--------------------------------------------------------------------------
##output
##int32
##--------------------------------------------------------------------------
##--------------------------------------------------------------------------









