##--------------------------------------------------------------------------
import pandas as pd
##--------------------------------------------------------------------------
data = {'Name':['suresh', 'rajesh', 'ramesh', 'naresh'],'Age':[28,34,29,42]}
df = pd.DataFrame(data, index=['rank1','rank2','rank3','rank4'])
print (df)
##--------------------------------------------------------------------------
##         Name  Age
##rank1  suresh   28
##rank2  rajesh   34
##rank3  ramesh   29
##rank4  naresh   42
##--------------------------------------------------------------------------
##--------------------------------------------------------------------------