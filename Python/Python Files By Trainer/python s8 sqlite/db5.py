##-------------------------------------------------------------------------
import sqlite3
##-------------------------------------------------------------------------
conn = sqlite3.connect('test')
print ("Opened database successfully")
##-------------------------------------------------------------------------
conn.execute("DELETE from COMPANY where ID = 2;")
conn.commit()
##-------------------------------------------------------------------------
print ("Total number of rows deleted :", conn.total_changes)
##-------------------------------------------------------------------------
cursor = conn.execute("SELECT id, name, address, salary from COMPANY")
##-------------------------------------------------------------------------
for row in cursor:
   print ("ID = ", row[0])
   print ("NAME = ", row[1])
   print ("ADDRESS = ", row[2])
   print ("SALARY = ", row[3], "\n")
##-------------------------------------------------------------------------
print ("Operation done successfully")
conn.close()
##-------------------------------------------------------------------------
##Opened database successfully
##Total number of rows deleted : 1
##ID =  1
##NAME =  anil
##ADDRESS =  pune
##SALARY =  20000.0 
##
##ID =  3
##NAME =  suresh
##ADDRESS =  hyderabad
##SALARY =  20000.0 
##
##ID =  4
##NAME =  ramesh
##ADDRESS =  banglore
##SALARY =  65000.0 
##
##Operation done successfully
##----------------------------------------------------------------------
##----------------------------------------------------------------------

-
