// Import MySQL connection.
var connection = require("../config/connection.js");

var orm = {
  selectAll: function(tableInput, cb) {
    var queryString = "SELECT * FROM " + tableInput + ";";
    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }
      cb(result);
    });
  },
  insertOne: function(burgerName, cb) {
    var queryString = "INSERT INTO burgers(burger_name) VALUES ('" + burgerName + "');"
    console.log(queryString)
    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }
      cb(result);
    });
  },
  // An example of objColVals would be {name: panther, sleepy: true}
  updateOne: function(table, ID, cb) {
    var queryString = "UPDATE " + table + " SET devoured = 1 WHERE id =" + ID + ";"
    console.log(queryString)

    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }

      cb(result);
    });
  }
};

// Export the orm object for the model (cat.js).
module.exports = orm;
