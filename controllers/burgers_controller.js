var express = require("express");

var router = express.Router();
var db = require("../models");

router.get("/", function(req, res) {
      db.burgers.findAll({raw: true}).then(function(dbUser) {
        var dataObject = {
          burgers: dbUser
        };
        res.render("index", dataObject);
     });
});

router.post("/", function(req, res) {
    db.burgers.create({
        burger_name: req.body.name,
        devoured: false
    }).then(function(dbUser) {
        res.redirect("/");    
    });
});

router.put("/:id", function(req, res) {
  var ID = req.params.id;
  db.burgers.update({devoured : true}, {
    where: {id: ID}
  }).then(function(dbUser) {
    res.redirect("/");  
  });
});


// Export routes for server.js to use.
module.exports = router;
