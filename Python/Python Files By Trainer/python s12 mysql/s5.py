##-----------------------------------------------------------------------
## show databases
##-----------------------------------------------------------------------
import mysql.connector  
##-----------------------------------------------------------------------
#Create the connection object   
##-----------------------------------------------------------------------
x = mysql.connector.connect(host = "localhost", user = "root",
                                 passwd = "root")  
##-----------------------------------------------------------------------
#creating the cursor object  
##-----------------------------------------------------------------------
y= x.cursor()  
##-----------------------------------------------------------------------
try:  
    z = y.execute("show databases")  
##-----------------------------------------------------------------------
except:  
    x.rollback()  
##-----------------------------------------------------------------------
for a in y:  
    print(a)  
##-----------------------------------------------------------------------
x.close()
##-----------------------------------------------------------------------
##-----------------------------------------------------------------------




