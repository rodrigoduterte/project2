var db = require("../models");

var obj1 = {
  animationEnabled: true,
  title: {
    text: "Follow Up Status Chart"
  },
  data: [
    {
      type: "pie",
      startAngle: 240,
      yValueFormatString: '##0.00"%"',
      indexLabel: "{label} {y}",
      dataPoints: null
      // [
      // 	{y: 0, label: "Customer is busy"},
      // 	{y: 0, label: "Call but no answer"},
      // 	{y: 0, label: "Need to discuss"},
      // 	{y: 0, label: "Already purchased"},
      // 	{y: 0, label: "No longer needed"},
      //   	{y: 0, label: "Not purchased now"},
      // 	{y: 0, label: "Follow up on sales order"},
      // 	{y: 0, label: "Shipped"},
      // 	{y: 0, label: "Order Completed"}
      // ]
    }
  ]
};

var obj2 = {
    
}

module.exports = function(qs, ob, cb) {
  // qs //'select * from `Followup Status Chart`'
  // cb //
  db.sequelize
    .query(qs, {
      type: db.sequelize.QueryTypes.SELECT
    })
    .then(function(data) {
      global[ob].data[0].dataPoints = data;
      cb(global[ob]);
    });
};
