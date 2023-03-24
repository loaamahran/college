const express = require('express');
const mysql=require('mysql');
const dotenv=require('dotenv');
const path=require('path');
const exp = require('constants');
const cookieParser=require('cookie-parser')
dotenv.config({path:'./.env'});// ./ they are in the same level path 
//path if you want to call any thing has the extension .env
const app=express();
const db=require('./database/db')
const publicDirectory=path.join(__dirname,'./public')
app.use(express.static(publicDirectory));
app.use(express.urlencoded({extended:false}));//just to make sure you grab data from any forms
app.use(express.json());//the data come from form as jsons 
app.use(cookieParser());// initiallize cookie to set up in our browser
app.set('view engine','hbs');

db.connect((err)=>{
if(err)    
{console.log(err);}

else
{console.log("Mysql is connected")}});

//define routes
app.get("/login", (req, res) => {
    res.render("login")
});

app.use('/', require('./routes/pages'))
app.use('/auth',require('./routes/auth'))//whenever go to auth swa2 register aw ay haga tnya i want to require some routes
//this will direct you to the router auth which has post method go to register
//app.use('/student/courses', require('./routes/student'))
app.use('/student', require('./routes/student'))
app.listen(5000,()=>{
console.log("server started at port 5000");

})