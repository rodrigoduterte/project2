var db = require("../models");
var path = require("path");

module.exports = function(app) {
  app.get("/customers", function(req, res) {
       res.render("customers");
   });
 
   //GET route for getting of follow-up of today
   app.get("/followups", function(req, res) {
    res.render("followups");
});

  app.get("/reports", function(req, res) {
    res.render("reports");
  });

  // Render 404 page for any unmatched routes
  app.get("*", function(req, res) {
    res.render("404");
  });
};
