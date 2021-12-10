const { Pool, Client } = require("pg");

const pool = new Pool({
  user: "harryji",
  host: "localhost",
  database: "auto-onborading",
  password: "12345678",
  port: "5432"
});


pool.query(
    "INSERT INTO jobs VALUES  (113216, 'Bananas', 105, 1971-07-13, 'Comedy', null, null, null, null, null, null, current_timestamp,current_timestamp);",
    (err, res) => {
      console.log(err, res);
      pool.end();
    }
  );