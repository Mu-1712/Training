##-------------------------------------------------------------------------
##lists are ordered ..it is a data structure..
##lists are editable
##lists allows duplicate values
##-------------------------------------------------------------------------
# 1. len()
# 2. append()
# 3. insert()
# 4. remove()
# 5. pop()
# 6. del 				
#	it stands for delete and it is a keyword
# 7. copy()
# 8. list()
# 9. clear()
# 10. count()
# 11. extend()
##-------------------------------------------------------------------------
x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##print(len(x))
##-------------------------------------------------------------------------
##7
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##for y in x:         # "for" and "in" are keywords
##    print(y)
##-------------------------------------------------------------------------
##sun
##mon
##tue
##wed
##thu
##fri
##sat
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##x.append("week")
##print(x)
##y=len(x)
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'week']
##8
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##x.insert(2,"week2")
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'week2', 'tue', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun,mon,tue,wed,thu,fri,sat"]
##print(x)
##y=len(x)
##print(y)
##-------------------------------------------------------------------------
##['sun,mon,tue,wed,thu,fri,sat']
##1
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##x.remove("tue")
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x.pop() # pop() removes latest topmost data element from the list
##print(y)
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##sat
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x.pop(3)
##print(y)
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##wed
##['sun', 'mon', 'tue', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##del x[2] # del is a keyword
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x.copy() # copies one list into another list
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x.copy(1,4) #...it allows only complete copy...
##print(y)
##-------------------------------------------------------------------------
##Traceback (most recent call last):
##  File "C:\Users\dhanp\OneDrive\python\python\python\python s0 fundamentals
##\6. lists.py", line 93, in <module>
##    y=x.copy(1,4)
##TypeError: list.copy() takes no arguments (2 given)
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x[1:4])
##-------------------------------------------------------------------------
##['mon', 'tue', 'wed']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x.copy("mon") 
##print(y)
##-------------------------------------------------------------------------
##Traceback (most recent call last):
##  File "C:\Users\dhanp\OneDrive\python\python\python\python s0 fundamentals\6. lists.py", line 103, in <module>
##    y=x.copy("mon")
##TypeError: list.copy() takes no arguments (1 given)
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x.list()  # error
##print(y)
##-------------------------------------------------------------------------
## AttributeError: 'list' object has no attribute 'list'
##-------------------------------------------------------------------------
##x="mba mca mcs"
##y=x.list()
##print(y)
##-------------------------------------------------------------------------
##Traceback (most recent call last):
##  File "C:\Users\dhanp\OneDrive\python\python\python\python s0 ##fundamentals\6. lists.py", line 123, in <module>
##    y=x.list()
##AttributeError: 'str' object has no attribute 'list'. Did you mean: ##'ljust'?
##-------------------------------------------------------------------------
##x="open it labz"
##y=list(x) # converts the string into list
##print(y)
##-------------------------------------------------------------------------
####['o', 'p', 'e', 'n', ' ', 'i', 't', ' ', 'l', 'a', 'b', 'z']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##x.clear()  # clears all the data from the list
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##[]
##-------------------------------------------------------------------------
##x=["sun","mon","tue","sun","thu","fri","sat"]
##print(x)
##y=x.count("sun") 
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'sun', 'thu', 'fri', 'sat']
##2
##-------------------------------------------------------------------------
##x=["sun","mon","tue","sun","thu","fri","sat"]
##print(x)
##y=x.count("jan") 
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'sun', 'thu', 'fri', 'sat']
##0
##-------------------------------------------------------------------------
##x1=[1,2,3]
##x2=[4,5,6]
##print(x1)
##print(x2)
##x3=x1+x2 # joins 2 lists
##print(x3)
##-------------------------------------------------------------------------
##[1, 2, 3]
##[4, 5, 6]
##[1, 2, 3, 4, 5, 6]
##-------------------------------------------------------------------------
##x1=[1,2,3]
##x2=[4,5,6]
##print(x1)
##print(x2)
##x1.extend(x2)
##print(x1)
##-------------------------------------------------------------------------
##[1, 2, 3]
##[4, 5, 6]
##[1, 2, 3, 4, 5, 6]
##-------------------------------------------------------------------------
##x=["sun","mon","tue","sun","thu","fri","sat"]
##print(x[1])
##-------------------------------------------------------------------------
##mon
##-------------------------------------------------------------------------
##x=["sun","mon","tue","sun","thu","fri","sat"]
##print(x)
##x[2]="sorry"
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'sun', 'thu', 'fri', 'sat']
##['sun', 'mon', 'sorry', 'sun', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","sun","thu","fri","sat"]
##print(x)
##y=x[2]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'sun', 'thu', 'fri', 'sat']
##tue
##-------------------------------------------------------------------------
##x=["sun","mon","tue","sun","thu","fri","sat"]
##print(x)
##y=x[-2]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'sun', 'thu', 'fri', 'sat']
##fri
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##del x[2]
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##del x[2]
##print(x)
##-------------------------------------------------------------------------
##[start slice:end slice:step]
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##del x[:-1]
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[:-1]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[1:-1]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['mon', 'tue', 'wed', 'thu', 'fri']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[::2]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'tue', 'thu', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[::-1] # it will reverse the list
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sat', 'fri', 'thu', 'wed', 'tue', 'mon', 'sun']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[3:]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[::-2]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sat', 'thu', 'tue', 'sun']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[:]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[1:3]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['mon', 'tue']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[-3:-1]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['thu', 'fri']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##y=x[:3]
##print(y)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'tue']
##-------------------------------------------------------------------------
##x=["sun","mon","tue","wed","thu","fri","sat"]
##print(x)
##del x[3:5]
##print(x)
##-------------------------------------------------------------------------
##['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
##['sun', 'mon', 'tue', 'fri', 'sat']
##-------------------------------------------------------------------------
##x=[1,"abc",99.67,"mba"] # allows all type of objects
##print(x)
##-------------------------------------------------------------------------
##[1, 'abc', 99.67, 'mba']
##-------------------------------------------------------------------------
##-------------------------------------------------------------------------
#			list assignments
##-------------------------------------------------------------------------
#1.	to display the longest string data element in the given list
##-------------------------------------------------------------------------
#2.	to display all the duplicate elements from the given list
##-------------------------------------------------------------------------
#3.	to lower case all the string elements in the given list
##-------------------------------------------------------------------------
#4.	to reverse all the string elements in the given list
##-------------------------------------------------------------------------
#5.	take an alpha numeric string from the user
#	create following 3 lists :
#		LC : lower case list
#		UC : upper case list
#		DG : digit list
##-------------------------------------------------------------------------
##-------------------------------------------------------------------------

















