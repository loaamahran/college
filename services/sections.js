const Mysql = require("../database/db");
const db = Mysql.connect();
// Database query promises
exports.getAll = async () => {
  return new Promise((resolve, reject) => {
    db.query("select * from sections", (err, results) => {
      if (err) return reject(err);
      return resolve(results);
    });
  });
};

exports.getOneById = async (id) => {
  return new Promise((resolve, reject) => {
    db.query(`select * from sections where id=${id}`, (err, results) => {
      if (err) return reject(err);
      return resolve(results);
    });
  });
};
