var db = require("../models");
// var reports = require("../config/reports");

module.exports = function(app) {
  app.get("/api/cb/customers", function(req, res) {
    db.sequelize
      .query("SELECT * FROM customerlist", {
        type: db.sequelize.QueryTypes.SELECT
      })
      .then(function(data) {
        res.json(data);
      });
  });

  app.get("/api/customers", function(req, res) {
    if (req.query.id === "1") {
      db.Customer.findAll({
        attributes: [
          "id",
          "firstname",
          "lastname",
          "phone",
          "email",
          "address",
          "interested"
        ],
        order: [["createdAt", "DESC"]],
        where: { interested: 1 },
        limit: 5
      }).then(function(data) {
        res.json(data);
      });
    } else if (req.query.id === "2") {
      db.Customer.findAll({
        order: [["createdAt", "DESC"]],
        where: { interested: 1 },
        limit: 10
      }).then(function(data) {
        res.json(data);
      });
    } else if (req.query.id === "3") {
      db.sequelize
        .query("SELECT * FROM `all interested customers`", {
          type: db.sequelize.QueryTypes.SELECT
        })
        .then(function(data) {
          res.json(data);
        });
    } else if (req.query.id === "4") {
      db.sequelize
        .query("SELECT * FROM `all uninterested customers`", {
          type: db.sequelize.QueryTypes.SELECT
        })
        .then(function(data) {
          res.json(data);
        });
    }
  });

  app.get("/api/followups", function(req, res) {
    if (req.query.id === "1") {
      db.sequelize
        .query("select * from `followups by interested customers`", {
          type: db.sequelize.QueryTypes.SELECT
        })
        .then(function(data) {
          console.log(data);
          res.json(data);
        });
    }
  });

  app.post("/api/customer", function(req, res) {
    db.Customer.create(req.body).then(function(data) {
      res.json(data);
    });
  });

  ///example URL /api/followup?id=1
  app.post("/api/followup", function(req, res) {
    db.FollowUp.create(req.body).then(function(data) {
      res.json(data);
    });
  });

  ///example URL /api/customer?id=1
  app.put("/api/customer", function(req, res) {
    db.Customer.update(
      { [req.body.columnName]: req.body.columnValue },
      { where: { id: req.query.id } }
    );
  });

  ///example URL /api/followup?id=1
  app.put("/api/followup", function(req, res) {
    if (req.body.columnName === 'status') {
      db.FollowUp.update(
        { 'FollowupStatusTypeId' : parseInt(req.body.columnValue)},
        { where: { id: parseInt(req.query.id) } }
      );
    } else {
      db.FollowUp.update(
        { [req.body.columnName] : req.body.columnValue},
        { where: { id: parseInt(req.query.id) } }
      );
    }
  });

  app.get("/api/reports", function(req, res) {
    if (req.query.id === 1) {
      reports("select * from `Followup Status Chart`", "obj1", function(data) {
        res.json(data);
      });
    } else if (req.query.id === 2) {
      // reports('select * from `Followup Status Chart`','obj1',function(data){
      //   res.json(data);
      // });
    }
  });
  app.get("/api/status", function(req, res) {
    db.sequelize
      .query("select * from followupstatustypes_trunc", {
        type: db.sequelize.QueryTypes.SELECT
      })
      .then(function(data) {
        res.json(data[0]);
      });
  });
};
