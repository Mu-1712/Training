##--------------------------------------------------------------------------
import pandas as pd
##--------------------------------------------------------------------------
s = pd.Series([1,2,3,4,5],index = ['a','b','c','d','e'])
##--------------------------------------------------------------------------
#retrieve the elements from 3rd indexed element onwards
print (s[3:])
##--------------------------------------------------------------------------
##d    4
##e    5
##dtype: int64
##--------------------------------------------------------------------------
##--------------------------------------------------------------------------