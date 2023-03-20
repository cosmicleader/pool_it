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
app.get("/", function(req, res) {
    res.send("Hello ");
});



//dynamic route for profile data
app.get("/profile/:id",function(req ,res){
    // res.render('index');
    var id = req.params.id;
    console.log(id);
    sql='SELECT name FROM profile where profile_id = ?';
    db.query(sql,[id]).then(results =>{
        // console.log(results)
        //res.send(results)
        res.render('profile', {data: results[0].name})
        
        
    });
});






// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://127.0.0.1:3000/`);
});