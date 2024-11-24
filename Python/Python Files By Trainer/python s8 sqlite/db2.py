##-------------------------------------------------------------------------
import sqlite3
##-------------------------------------------------------------------------
conn = sqlite3.connect('test')
print ("Opened database successfully")
##-------------------------------------------------------------------------
conn.execute("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (1, 'anil', 22, 'pune', 20000.00 )");
##-------------------------------------------------------------------------
conn.execute("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (2, 'sunil', 25, 'chennai', 15000.00 )");
##-------------------------------------------------------------------------
conn.execute("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (3, 'suresh', 23, 'hyderabad', 20000.00 )");
##-------------------------------------------------------------------------
conn.execute("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (4, 'ramesh', 30, 'banglore', 65000.00 )");
##-------------------------------------------------------------------------
conn.commit()
print ("Records inserted successfully")
conn.close()
##-------------------------------------------------------------------------
##Opened database successfully
##Records inserted successfully
##-------------------------------------------------------------------------
##-------------------------------------------------------------------------






