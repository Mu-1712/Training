// Create a new database.
use('mydb');

// Create a new collection.
db.createCollection("clients");

db.clients.insertMany([
    {"id":101, "name":"Peter", "project_Domain":"Finance","age":25, "country":"US"},
    {"id":102, "name":"Jhonathan","project_Domain":"Banking","age":35, "country":"UK"},
    {"id":103, "name":"Christa","age":42, "country":"Tesla"},
    {"id":104, "name":"Jessica", "project_Domain":"Services","age":28},])

//fetch
db.clients.find()

//db.clients.drop();

//limit
db.clients.find().limit(2)

//skip
db.clients.find().skip(2)

//sorting
db.clients.find().sort({"id":-1})
db.clients.find({}, {"_id":0}).sort({"id":-1})
db.clients.find({}, {"_id":0}).sort({"name":1})

//Index
db.clients.createIndex({"name":1})
db.clients.createIndex({"id":-1})
db.clients.createIndexes([{"project_Domain":1},{"country":-1}])
db.clients.getIndexes()
db.clients.totalIndexSize()
db.clients.storageSize()
db.clients.dropIndex({"name":1})

//sum
db.clients.aggregate([{$group: {
  _id: "$by_user",
  total: {
    $sum:"$age"
  }
}}])

//without group we cant perform aggregation
db.clients.aggregate({
    total: {
      $sum:"$age"
    }
  })

//push
db.clients.aggregate([{$group: {
    _id: "$by_user",
    name: {
      $push:"$name"
    }
  }}])
  
//first
db.clients.aggregate([{$group: {
    _id: "$by_user",
    name: {
      $first:"$name"
    }
  }}])

//last
db.clients.aggregate([{$group: {
    _id: "$by_user",
    name: {
      $last:"$name"
    }
}}])


var bulk = db.users.initializeOrderedBulkOp();

bulk.insert({user: "centhil", Payment_status:"Progress", Amont:10000, mode:"Gpay"});
bulk.insert({user: "yash", Payment_status:"Failed",Amont:20000, mode:"Phonepay"});
bulk.insert({user: "Ram", Payment_status:"Success", Amont:40000,mode:"Paytm"});
bulk.insert({user: "Murthy", Payment_status:"Progress",Amont:60000, mode:"Gpay"});
bulk.insert({user: "chichek", Payment_status:"On-hold",Amont:80000, mode:"Cash"});

bulk.find({Payment_status:"Failed"}).remove();
bulk.find({Payment_status:"On-hold"}).update({$set: {Payment_status:"Onhold"}});

bulk.execute();
db.users.find()
db.users.drop()

var bulk = db.users2.initializeUnorderedBulkOp();

bulk.find({Payment_status:"Failed"}).remove();
bulk.find({Payment_status:"Onhold"}).update({$set: {Payment_status:"Onhold2"}});

bulk.insert({user: "centhil", Payment_status:"Progress", mode:"Gpay"});
bulk.insert({user: "yash", Payment_status:"Failed", mode:"Phonepay"});
bulk.insert({user: "Ram", Payment_status:"Success", mode:"Paytm"});
bulk.insert({user: "Murthy", Payment_status:"Progress", mode:"Gpay"});
bulk.insert({user: "chichek", Payment_status:"Onhold", mode:"Cash"});

bulk.execute();
db.users2.find()

//runcommand
db.runCommand(
    {
        find: "clients",
        filter:{age: {$gte: 35}},
        projection: {"_id":0},
        sort: {name: 1},
        limit:(2)
    }
)

db.users.findAndModify(
    {
        query:{user:"chichek"},
        projection: {"_id":0},
        update:{$set: {Payment_status: "Transaction Successfull"},$inc: {Amount: 500}},
        upsert: true,
        limit:(2)
    }
);
      