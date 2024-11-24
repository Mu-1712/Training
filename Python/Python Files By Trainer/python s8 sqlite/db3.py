##-------------------------------------------------------------------------
import sqlite3
##-------------------------------------------------------------------------
conn = sqlite3.connect('test')
print ("Opened database successfully")
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
##ID =  1
##NAME =  anil
##ADDRESS =  pune
##SALARY =  20000.0 
##
##ID =  2
##NAME =  sunil
##ADDRESS =  chennai
##SALARY =  15000.0 
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
