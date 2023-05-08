// Import express.js
const express = require("express");
const { render } = require("pug");

const { User } = require("./models/user");
// Create express app
var app = express();
// Use the Pug templating engine
app.set("view engine", "pug");
app.set("views", "./app/views");

const bodyParser = require("body-parser");

app.use(bodyParser.json()).use(
  bodyParser.urlencoded({
    extended: true,
  })
);
// Add static files location
app.use(express.static("static"));
// Set the sessions
var session = require("express-session");
app.use(
  session({
    secret: "secretkeysdfjsflyoifasd",
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false },
  })
);

// Get the functions in the db.js file to use
const db = require("./services/db");

// Create a route for root - /
app.get("/home", function (req, res) {
  res.render("home");
});
// Login
app.get("/login", function (req, res) {
  res.render("login");
});

app.get("/long_trip", function (req, res) {
  res.render("long_trip");
});

app.get("/routematching", function (req, res) {
  res.render("routematching");
});




app.get("/result_routematching", function(req, res) {
    res.render("result_routematching");
    
});        
// Register
app.get("/register", function (req, res) {
  res.render("register");
});







//dynamic route for profile data
app.get("/profile/:id", function (req, res) {
  // res.render('index');
//   var id = req.session.uid;
var id = 5
//   if(req.session.uid==null){render('login');};
  console.log(id);
  sql = "SELECT * FROM Users where id = ?";
  db.query(sql, [id]).then((results) => {
    console.log(results);
    //res.send(results)
    res.render("profile", {
      email: results[0].email,
      name: results[0].email,
      contact: results[0].id,
    });
  });
});
// Logout
app.get("/logout", function (req, res) {
  req.session.destroy();
  res.redirect("/login");
});

app.post("/set-password", async function (req, res) {
  params = req.body;
  var user = new User(params.email);
  try {
    uId = await user.getIdFromEmail();
    if (uId) {
      // If a valid, existing user is found, set the password and redirect to the users single-student page
      await user.setUserPassword(params.password);
      // res.redirect('/single-student/' + uId);
      res.send("Congrats... Your Account is ready");
    } else {
      // If no existing user is found, add a new one
      newId = await user.addUser(params.email);
      res.render("home");
    }
  } catch (err) {
    console.error(`Error while adding password `, err.message);
  }
});

// // Check submitted email and password pair
// app.post('/authenticate', async function (req, res) {
//     params = req.body;
//     var user = new User(params.email);
//     try {
//         uId = await user.getIdFromEmail();
//         if (uId) {
//             match = await user.authenticate(params.password);
//             if (match) {
//                 res.redirect('/single-student/' + uId);
//             }
//             else {
//                 // TODO improve the user journey here
//                 res.send('invalid password');
//             }
//         }
//         else {
//             res.send('invalid email');
//         }
//     } catch (err) {
//         console.error(`Error while comparing `, err.message);
//     }
// });

// Check submitted email and password pair
app.post("/authenticate", async function (req, res) {
  params = req.body;
  console.log("request body", req.body);
  console.log("Email from", params.email);
  var user = new User(params.email);
  try {
  var  uId = await user.getIdFromEmail();
    console.log("uid = ", uId)
    if (uId) {
      match = await user.authenticate(params.password);
      if (match) {
        req.session.uid = uId;
        req.session.loggedIn = true;
        console.log(req.session);
        res.redirect("/profile/" + uId);
      } else {
        // TODO improve the user journey here
        res.send("invalid password");
      }
    } else {
      res.send("invalid email");
    }
  } catch (err) {
    console.error(`Error while comparing `, err.message);
  }
});

// Create a route for root - /
app.get("/", function (req, res) {
  console.log(req.session);
  if (req.session.uid) {
    res.send("Welcome back, " + req.session.uid + "!");
  } else {
    res.send("Please login to view this page!");
  }
  res.end();
});

// Start server on port 3000
app.listen(3000, function () {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
