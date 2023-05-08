
// Import express.js
const express = require("express");
const { render } = require("pug");

const { User } = require("./models/user");
// Create express app
var app = express();
// Use the Pug templating engine
app.set('view engine', 'pug');
app.set('views', './app/views');
// Add static files location
app.use(express.static("static"));
// Set the sessions
var session = require('express-session');

const bodyParser = require('body-parser');

app.use(bodyParser.json());

app.use(session({
  secret: 'secretkeysdfjsflyoifasd',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));


// Get the functions in the db.js file to use
const db = require('./services/db');

// Create a route for root - /
app.get("/home", function(req, res) {
    res.render("home");
});
// Login
app.get('/login', function (req, res) {
    res.render('login');
});

app.get("/long_trip", function(req, res) {
    res.render("long_trip");
});

app.get("/routematching", function(req, res) {
    res.render("routematching");
});

app.get("/result_routematching", function(req, res) {
    res.render("result_routematching");
});

//dynamic route for profile data
app.get("/profile",function(req ,res){
    // res.render('index');
    var id =  req.session.uid;
    console.log(id);
    sql='SELECT * FROM profile where profile_id = ?';
    db.query(sql,[id]).then(results =>{
        console.log(results)
        //res.send(results)
        res.render('profile', {email: results[0].email,name: results[0].name,contact: results[0].contact})
        
        
    });
});
// Logout
app.get('/logout', function (req, res) {
    req.session.destroy();
    res.redirect('/login');
  });

app.post('/set-password', async function (req, res) {
    params = req.body;
    var user = new User(params.email);
    try {
        uId = await user.getIdFromEmail();
        if (uId) {
            // If a valid, existing user is found, set the password and redirect to the users single-student page
            await user.setUserPassword(params.password);
            res.redirect('/single-student/' + uId);
        }
        else {
            // If no existing user is found, add a new one
            newId = await user.addUser(params.email);
            res.send('Perhaps a page where a new user sets a programme would be good here');
        }
    } catch (err) {
        console.error(`Error while adding password `, err.message);
    }
});
// Check submitted email and password pair
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
app.post('/authenticate', async function (req, res) {
    params = req.body;
    console.log('request body', (req.body));
    console.log('Email from', (params.email));
    var user = new User(params.email);
    try {
        uId = await user.getIdFromEmail();
        if (uId) {
            match = await user.authenticate(params.password);
            if (match) {
                req.session.uid = uId;
                req.session.loggedIn = true;
                console.log(req.session);
                res.redirect('/profile/' + uId);
            }
            else {
                // TODO improve the user journey here
                res.send('invalid password');
            }
        }
        else {
            res.send('invalid email');
        }
    } catch (err) {
        console.error(`Error while comparing `, err.message);
    }
});


// Create a route for root - /
app.get("/", function(req, res) {
    console.log(req.session);
    if (req.session.uid) {
		res.send('Welcome back, ' + req.session.uid + '!');
	} else {
		res.send('Please login to view this page!');
	}
	res.end();
});





// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://127.0.0.1:3000/`);
});