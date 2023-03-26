const mysql = require("mysql");

module.exports = class Mysql {
  static connect() {
    // establish connection
    const db = mysql.createConnection({
      host: process.env.DATABASE_HOST,
      user: process.env.DATABASE_USER,
      password: process.env.DATABASE_PASSWORD,
      database: process.env.DATABASE,
    });
    // connect to database
    db.connect((err) => {
      if (err) {
        throw err;
      }
      console.log("Mysql Connected");
    });
    return db;
  }
};
