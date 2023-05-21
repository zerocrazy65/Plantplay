const express = require("express");
const app = express();
const hostname = "127.0.0.1";
const port = 3000;
const bodyParser = require("body-parser");
const mysql = require("mysql");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

const con = mysql.createConnection({
   host: hostname,
   user: "root",
   password: "123123",
   database: "mycompany",
});
con.connect((err) => {
   if (err) throw console.log(err);
   else {
      console.log("Is Connected na");
   }
});

const getDbTest = async () => {
   let sql = `SELECT product_info.info_id, product_info.pd_id, product_detail.pd_detail
   FROM product_info
   JOIN product_detail ON product_info.pd_id = product_detail.pd_id;
   `;
   let result = await queryDB(sql);
   console.log(result);
};

// app.get("/showDB", async (req, res) => {
//    let sql = `SELECT user_id, username, email, password FROM ${tableName}`;
//    let result = await queryDB(sql);
//    console.log(result);
//    result = Object.assign({}, result);
//    res.json(result);
// });

const queryDB = (sql) => {
   return new Promise((resolve, reject) => {
      // query method
      con.query(sql, (err, result) => {
         if (err) reject(err);
         else resolve(result);
      });
   });
};

getDbTest();

app.listen(port, hostname, () => {
   console.log(`Server running at http://${hostname}:${port}/`);
});
