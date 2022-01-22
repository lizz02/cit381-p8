let mysql = require('mysql2');
let dbInfo = require('./dbInfo.js');
let express = require('express');
let bodyParser = require("body-parser");

let app = express();

// Add static route for non-Node.js pages
app.use(express.static('public'));

// Configure body parser for handling post operations
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Get user
app.get('/user/:USER_ID?', function (req, res) {
   console.log("Route /user GET", req.params);
   let data = [];
   let sql = "SELECT * FROM USER";
   if (req.params.USER_ID != undefined) {
      sql += " WHERE USER_ID = ?";
      data = [req.params.USER_ID];
      console.log(data);
   } else {
      sql += " ORDER BY USER_ID";
   }
   console.log("SQL", sql);
   connection.query(sql, data,
      function (errQuery, rows) {
         if (errQuery) {
            console.log(errQuery);
            res.json({rows: [], err: errQuery});
         } else if (rows) {
            console.log("Rows returned", rows.length);
            res.json({rows: rows, err: ""});
         } else {
            console.log("No user rows...\n");
            res.json({rows: [], err: ""});
         }
      }
   );
});

// Get item type
app.get('/type/:TYPE_ID?', function (req, res) {
   console.log("Route /type GET", req.params);
   let data = [];
   let sql = "SELECT * FROM ITEM_TYPE";
   if (req.params.TYPE_ID != undefined) {
      sql += " WHERE TYPE_ID = ?";
      data = [req.params.TYPE_ID];
      console.log(data);
   } else {
      sql += " ORDER BY TYPE_ID";
   }
   console.log("SQL", sql);
   connection.query(sql, data,
      function (errQuery, rows) {
         if (errQuery) {
            console.log(errQuery);
            res.json({rows: [], err: errQuery});
         } else if (rows) {
            console.log("Rows returned", rows.length);
            res.json({rows: rows, err: ""});
         } else {
            console.log("No item type rows...\n");
            res.json({rows: [], err: ""});
         }
      }
   );
});

// Add color
app.post('/type', function (req, res) {
   console.log("Route /type POST");
   let data = {TYPE_ID: req.body.type_id, 
      TYPE_NAME: req.body.type_name,
      MAX_ITEM: req.body.max_item,
      RARITY: req.body.rarity,
      LIMITED_EVENT_ID: req.body.limited_event_id};
   connection.query("INSERT INTO ITEM_TYPE SET ?", 
      data, 
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            res.json({status: "Error", err: errQuery});
         } else {
            console.log("Insert ID: ", result.insertId);
            res.json({status: result.insertId, err: ""});
         }
      }
   );
});

// Delete item
app.delete('/type/:TYPE_ID?', function (req, res) {
   console.log("Route /type DELETE");
   let sql = "DELETE FROM ITEM_TYPE WHERE TYPE_ID = ?";
   if (req.params.TYPE_ID != undefined) {
      let data = [req.params.TYPE_ID];
      connection.query(sql, 
         data, 
         function (errQuery, result) {
            if (errQuery) {
               console.log(errQuery);
               res.json({status: "Error", err: errQuery});
            } else {
               console.log("Deleted");
               res.json({status: "Deleted", err: ""});
            }
         }
      );
   } else {
      let s = "Invalid or missing TYPE_ID";
      console.log(s);
      res.json({status: "Error", err: s});
   }
});

// Update item
app.put('/type', function (req, res) {
   console.log("Route /type PUT");
   let data = [{
      TYPE_ID: req.body.type_id, 
      TYPE_NAME: req.body.type_name,
      MAX_ITEM: req.body.max_item,
      RARITY: req.body.rarity,
      LIMITED_EVENT_ID: req.body.limited_event_id}, req.body.id];
   connection.query("UPDATE ITEM_TYPE SET ? WHERE TYPE_ID=?",  
      data, 
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            res.json({status: "Error", err: errQuery});
         } else {
            console.log("Updated ID: ", req.body.id, ", Affected Rows: ", result.affectedRows);
            res.json({status: req.body.type_id, err: "", message: "Row updated"});         }
      }
   );
});

// Handle missing pages requested using GET HTTP verb
app.get('*', function(req, res) {
   res.status(404).send('Sorry that page does not exist');
});

// Create database connection
console.log('Creating connection...\n');
let connection = mysql.createConnection({
   host: dbInfo.dbHost,
   port: dbInfo.dbPort,
   user: dbInfo.dbUser,
   password: dbInfo.dbPassword,
   database: dbInfo.dbDatabase
});
// Connect to database
connection.connect(function(err) {
   console.log('Connecting to database...\n');

   // Handle any errors
   if (err) {
      console.log(err);
      console.log('Exiting application...\n');
   } else {
      console.log('Connected to database...\n');
      // Listen for connections
      // Note: Will terminate with an error if database connection
      // is closed
      const ip = 'localhost';
      const port = 8080;
      app.listen(port, ip, function () {
         try {
            console.log('assign08 server app listening on port ' + port);
         } catch (err) {
            console.log(err);
         }
      });
   }
});