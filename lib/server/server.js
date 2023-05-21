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
      console.log("Is Connected ner");
   }
});

// const getDbTest = async () => {
//    let sql = `SELECT product_info.p_id, product_info.pd_id, product_detail.pd_light,pd_temp,pd_water
//    FROM product_info
//    JOIN product_detail ON product_info.pd_id = product_detail.pd_id;
//    `;
//    let result = await queryDB(sql);
//    console.log(result);
// };


app.post("/signup", async (req, res) => {
   let sql = `INSERT INTO user_info (u_first, u_last, u_email, u_pass) VALUES ("${req.body.fname}", "${req.body.lname}", "${req.body.email}", "${req.body.password}")`;
   let result = await queryDB(sql);
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
   let sql = `SELECT * from product_info`;
   let result = await queryDB(sql);
   result = Object.assign({}, result);
   res.json(result);
});

app.get("/store/:p_id", async (req, res) => {
   const p_id = req.params.p_id;
   let sql = `
      SELECT product_info.p_img, product_info.p_name, product_info.p_price, product_info.p_describe, product_info.p_rating, product_detail.pd_light, pd_temp, pd_water
      FROM product_info
      JOIN product_detail ON product_info.pd_id = product_detail.pd_id
      WHERE product_info.p_id = '${p_id}';
   `;
   let result = await queryDB(sql);
   res.json(result);
});

app.post("/record-slip", async (req, res) => {
   let sql = `INSERT INTO slip_info (u_id, p_id, s_amount) VALUES ("${req.body.userID}", "${req.body.productID}", "${req.body.amount}")`;
   let result = await queryDB(sql);
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
