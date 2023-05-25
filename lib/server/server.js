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
   // password: "N0w@2544",
   database: "mycompany",
});

con.connect((err) => {
   if (err) throw console.log(err);
   else {
      console.log("Is Connected ner");
   }
});

app.post("/signup", async (req, res) => {
   const fname = req.body.fname;
   const lname = req.body.lname;
   const email = req.body.email;
   const password = req.body.password;
   const sql = `INSERT INTO user_info (u_first, u_last, u_email, u_pass) VALUES ("${fname}", "${lname}", "${email}", "${password}")`;
   const result = await queryDB(sql);
   res.end("Record to database successfully");
});

app.post("/signin", async (req, res) => {
   try {
      const email = req.body.email;
      const password = req.body.password;
      const sql = `SELECT COUNT(*) AS count FROM user_info WHERE u_email = "${email}" AND u_pass = "${password}"`;
      const result = await queryDB(sql);
      const count = result[0].count;
      if (count === 1) {
         console.log("Authentication successful");
         res.send("Authentication successful");
      } else {
         console.log("Authentication failed");
         res.send("Authentication failed");
      }
   } catch (error) {
      console.error("Error occurred:", error);
      res.status(500).send("Internal Server Error");
   }
});

app.get("/store", async (req, res) => {
   const sql = `SELECT * from product_info`;
   let result = await queryDB(sql);
   result = Object.assign({}, result);
   res.json(result);
});

app.get("/store/:p_id", async (req, res) => {
   const p_id = req.params.p_id;
   const sql = `
      SELECT product_info.p_img, product_info.p_type, product_info.p_name, product_info.p_price, product_info.p_describe, product_info.p_rating, product_detail.pd_light, pd_temp, pd_water
      FROM product_info
      JOIN product_detail ON product_info.pd_id = product_detail.pd_id
      WHERE product_info.p_id = '${p_id}';
   `;
   const result = await queryDB(sql);
   res.json(result);
});

app.post("/record-slip", async (req, res) => {
   const email = req.body.email;
   const productID = req.body.productID;
   const amount = req.body.amount;
   const sql = `INSERT INTO slip_info (u_id, p_id, s_amount) VALUES ("${email}", "${productID}", "${amount}")`;
   const result = await queryDB(sql);
   res.end("Record to database successfully");
});

const queryDB = (sql) => {
   return new Promise((resolve, reject) => {
      // query method
      con.query(sql, (err, result) => {
         if (err) reject(err);
         else resolve(result);
      });
   });
};

app.listen(port, hostname, () => {
   console.log(`Server running at http://${hostname}:${port}/`);
});
