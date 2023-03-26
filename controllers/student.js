const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const Mysql = require("../database/db");
const db = Mysql.connect();
const express = require("express");
const router = express.Router();
// Database query promises
const zeroParamPromise = (sql) => {
  return new Promise((resolve, reject) => {
    db.query(sql, (err, results) => {
      if (err) return reject(err);
      return resolve(results);
    });
  });
};

const queryParamPromise = (sql, queryParam) => {
  return new Promise((resolve, reject) => {
    db.query(sql, queryParam, (err, results) => {
      if (err) return reject(err);
      return resolve(results);
    });
  });
};
exports.courses = async (req, res) => {
  let status = 200;
  try {
    const query = "SELECT * FROM courses";
    const [rows] = await db.query(query);
    res.status(status).json(rows);
  } catch (err) {
    console.error(err);
    res.status(status).json();
  }
};

/*exports.courses= async(req,res,next)=>{
  //console.log(req.cookies);// check if you hav any cookies in your browser
  if(req.cookies.jwt){// you may have multiple cookies so we need only jwt
  try{
  // we will decode all tokens
  //1)verify token
  const decoded= await promisify(jwt.verify)//verify function from jwt check token
  (req.cookies.jwt,
  process.env.JWT_SECRET //check the secret password    
  )
  console.log(decoded);// will show user id when token make and when expire
  //2) check if user still exist
  db.execute('select * from courses',(error,result)=>{
  console.log(result);
  if(!result){
   return next();   
  }
  req.courses = result[0];// variable user
  return next();
  })
  }
  catch(error)
  {console.log(error);
  return next();
  }
  }
  else{next(); // if we don't have cookie next any way
  }
}
*/
//courses
exports.courses = async (req, res) => {
  db.query(
    "select id,name,prerequisites,hall,type,credits,time from courses",
    (err, res) => {
      res.render("courses", { res: courses });
    }
  );
};

// Fixed
// //sections
// exports.sections = async (req, res) => {
//   db.query("select * from sections", (err, sections) => {
//     console.log({ sections });
//     res.render("sections", { sections });
//   });
// };

// I prefer this way
const { getAll } = require("../services/sections");
exports.sections = async (req, res) => {
  const sections = await getAll();
  res.render("sections", { sections });
};
