// Import express.js
const express = require("express");
const { render } = require("pug");

// Create express app
var app = express();
// Use the Pug templating engine
app.set('view engine', 'pug');
app.set('views', './app/views');
// Add static files location
app.use(express.static("static"));

// Get the functions in the db.js file to use
const db = require('./services/db');

// Create a route for root - /
app.get("/home", function(req, res) {
    res.render("home");
});

app.get("/login", function(req, res) {
    res.render("login");
});
app.get("/long_trip", function(req, res) {
    res.render("long_trip");
});

app.get("/routematching", function(req, res) {
    res.render("routematching");
});

//dynamic route for profile data
app.get("/profile/:id",function(req ,res){
    // res.render('index');
    var id = req.params.id;
    console.log(id);
    sql='SELECT * FROM profile where profile_id = ?';
    db.query(sql,[id]).then(results =>{
        console.log(results)
        //res.send(results)
        res.render('profile', {email: results[0].email,name: results[0].name,contact: results[0].contact})
        
        
    });
});






// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://127.0.0.1:3000/`);
});