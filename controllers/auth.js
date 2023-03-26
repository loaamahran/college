const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { render } = require("hbs");
const { cookie } = require("express-validator");
const { promisify } = require("util");
const { error } = require("console");

const Mysql = require("../database/db")
const db = Mysql.connect()

exports.login = async (req, res) => {
  try {
    console.log(req.body);
    const email = req.body.email;
    const password = req.body.password;
    //const id=req.body.id;

    if (!email || !password) {
      return res
        .status(400)
        .render("login", { message: "Please enter Email,Password" });
    } // lw mfesh mail aw password
    db.query(
      "select * from student where email=?",
      [email],
      async (error, results) => {
        console.log(results);
        if (results.length == 0) {
          //email is already registred
          return res.render("login", {
            message: "That Email or ID not in use",
          });
        }
        if (
          !results ||
          !(await bcrypt.compare(password, results[0].password))
        ) {
          //not find users in database or wrong password
          res
            .status(401)
            .render("login", { message: "Email or password is incorrect" });
        } else {
          const id = results[0].id; //everything is okay
          const token = jwt.sign({ id }, process.env.JWT_SECRET, {
            expiresIn: process.env.JWT_EXPIRES_IN,
          }); //or id:id
          console.log("Token is" + token);
          const cookieOptions = {
            expires: new Date(
              Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
            ),
            httpOnly: true, //to make sure that we only set up our cookie if we are in http environment
          };
          //what is actually going to set up our cookie in the browser
          res.cookie("jwt", token, cookieOptions); //jwt name of te cookie token is the value
          res.status(200).redirect("/"); // if is every thing is okay
        }
      }
    );
  } catch (error) {
    console.log(error);
  }
};

exports.register = (req, res) => {
  console.log(req.body);
  const name = req.body.name; // .name dh elasm ely fe elform
  const email = req.body.email;
  const password = req.body.password;
  const passwordConfirm = req.body.passwordConfirm;
  const id = req.body.id;
  //const {name,email,password,passwordConfirm}=req.body dh hwa hwa elstor ely fo2
  db.query(
    "SELECT email,id from student where email=? or id=?",
    [email, id],
    async (error, results) => {
      if (error) {
        console.log(error);
      }
      if (results.length > 0) {
        //email is already registred
        return res.render("register", {
          message: "That Email or ID is already in use",
        });
      } else if (password !== passwordConfirm) {
        return res.render("register", {
          message: "Password not match",
        });
      }

      let hashedPassword = await bcrypt.hash(password, 8);
      console.log(hashedPassword);
      db.query(
        "insert into student set ?",
        { name: name, email: email, password: hashedPassword, id: id },
        (error, results) => {
          if (error) {
            console.log(error);
          } else {
            res.render("index", { message: "User registered" });
          }
        }
      );
    }
  );
};
exports.isLoggedIn = async (req, res, next) => {
  //console.log(req.cookies);// check if you hav any cookies in your browser
  if (req.cookies.jwt) {
    // you may have multiple cookies so we need only jwt
    try {
      // we will decode all tokens
      //1)verify token
      const decoded = await promisify(jwt.verify)(
        //verify function from jwt check token
        req.cookies.jwt,
        process.env.JWT_SECRET //check the secret password
      );
      console.log(decoded); // will show user id when token make and when expire
      //2) check if user still exist
      db.query(
        "select * from student where id=?",
        [decoded.id],
        (error, result) => {
          console.log(result);
          if (!result) {
            return next();
          }
          req.user = result[0]; // variable user
          return next();
        }
      );
    } catch (error) {
      console.log(error);
      return next();
    }
  } else {
    next(); // if we don't have cookie next any way
  }
};
exports.profileData = async (req, res, next) => {
  //console.log(req.cookies);// check if you hav any cookies in your browser
  if (req.cookies.jwt) {
    // you may have multiple cookies so we need only jwt
    try {
      // we will decode all tokens
      //1)verify token
      const decoded = await promisify(jwt.verify)(
        //verify function from jwt check token
        req.cookies.jwt,
        process.env.JWT_SECRET //check the secret password
      );
      console.log(decoded); // will show user id when token make and when expire
      //2) check if user still exist
      db.query(
        "select * from student_profile where id=?",
        [decoded.id],
        (error, result) => {
          console.log(result);
          if (!result) {
            return next();
          }
          req.student = result[0]; // variable user
          return next();
        }
      );
    } catch (error) {
      console.log(error);
      return next();
    }
  } else {
    next(); // if we don't have cookie next any way
  }
};
exports.logout = async (req, res) => {
  //res.cookie mean setup new cookie and we have one called jwt so it will overwrite on it logout is the value
  res.cookie("jwt", "logout", {
    // 2 is 2 seconds after you press logout your cookie will expire in 2seconds wiil automatically remove from browser
    expires: new Date(Date.now() + 2 * 1000),
    httpOnly: true,
  });
  res.status(200).redirect("/");
};
