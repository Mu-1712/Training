// Create a new database.
use(mydb);

// Create a new collection.
db.createCollection("students");

mongod --replSet "rs0" --dbpath /data/db1 --port 27017

mongo.exe --host:127.0.0.1 --port 27017;

rsconfig = {
              _id: "rs0"
              memebers:[{
                _id: 0,
                host: "localhost:"
              }]
}

rs.isMaster().Primary()

rs.printslaveReplicationInfo()

rs