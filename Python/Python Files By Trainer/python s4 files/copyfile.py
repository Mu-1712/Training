### copy one file into another file
### abc.txt (source file)  -> xyz.txt (destination file)
#--------------------------------------------------------------------------
##f1=open("abc.txt","r")
##f2=open("xyz.txt","w")
##s1=f1.read()
##f2.write(s1)
### now check the xyz.txt file
##print("thanku")
##f1.close()
##f2.close()
#--------------------------------------------------------------------------

##..write a program to store the file data in reverse order in another file..
#--------------------------------------------------------------------------
f1=open("abc.txt","r")
f2=open("xyz.txt","w")
s1=f1.read()
s2=s1[::-1] # data is getting reversed
f2.write(s2)
f1.close()
f2.close()
print("thanku")
##thanku
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------



