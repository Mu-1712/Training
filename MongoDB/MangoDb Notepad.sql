// Create a new collection.
db.createCollection("emp");

show collections

db.createCollection("emp2", {capped:true, size:5142400, max:100})

db.emp3.insert({"empid":101})

db.emp.find()
db.emp2.find()
db.emp3.find()

db.emp4.insert({"empid":101, "name":"Yashwanth", "age":25, "city":"pune",
                "empid":102, "name":"Ram", "age":22, "city":"mumbai"})

//fetch documents from emp4
db.emp4.find()

//inserting multiple documents(rows), inserMany is used
db.employees.insertMany([
{"empid":101, "name":"Yashwanth", "age":25, "city":"pune","cars":["BMW", "mercedees", "ODI"]},
{"empid":102, "name":"Ram", "age":24, "city":"mumbai", "cars":["BMW", "mercedees"]},
{"empid":103, "name":"dP", "age":21, "city":"chennai"}
])

db.employees.find().pretty()

db.employees.find({"age":21}).pretty()

//fetch from employess where age is greaterthan 21
db.employees.find({"age" :{"$gt":21}}).pretty()

//fetch from employess where age is lessthan 21
db.employees.find({"age" :{"$lt":24}}).pretty()

//fetch from employess where age is not equal to 24
db.employees.find({"age" :{"$ne":24}}).pretty()

//fetch from employess using AND Operator, her (') is AND
db.employees.find({$or:[{"cars":"odi"},{"age":{"$gte":25}}]}).pretty()

db.employees.find({"age":{"$lt":22},$or:[{"name":"dP"},{"name":"preeti"}]}).pretty()


db.employees.update({"name":"dP"},{$set:{"name":"Bhargav"}})

db.employees.update({"cars":"BMW"},{$set:{"cars":"suzuki"}},{multi:true})

db.customer.insertMany([
    {"empid":101, "name":"Yashwanth", "age":25, "city":"pune","cars":["BMW", "mercedees", "ODI"]},
    {"empid":102, "name":"Ram", "age":24, "city":"mumbai", "cars":["BMW", "mercedees"]},
    {"empid":103, "name":"dP", "age":21, "city":"chennai"}
    ])

db.customer.find().pretty();
db.customer.update({"cars":"BMW"},{$set:{"cars":["suzuki","TATA"]}})

db.customer.drop()
db.customer.find({},{"_id":0},{"empid":1})