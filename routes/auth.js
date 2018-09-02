var authController = require("../controllers/authcontroller.js");


module.exports = function(app, passport) {
  app.get("/signup", authController.signup);
  app.get("/", authController.signin);
  app.get("/followups", isLoggedIn, authController.dashboard);
  app.get("/customers", isLoggedIn, authController.customers);
  app.get("/logout", authController.logout);

  app.post(
    "/signup",
    passport.authenticate("local-signup", {
      successRedirect: "/followups",

      failureRedirect: "/signup"
    })
  );

  app.post(
    "/signin",
    passport.authenticate("local-signin", {
      successRedirect: "/followups",

      failureRedirect: "/"
    })
  );

  function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()) return next();

    res.redirect("/");
  }
};
