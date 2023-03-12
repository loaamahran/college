const express = require('express');
const authController=require('../controllers/auth')
const router = express.Router();
router.get('/',authController.isLoggedIn,(req,res)=>{
res.render('index',{
user:req.user    
});});


router.get('/register',(req,res)=>{
res.render('register');
});


router.get('/login', (req, res) => {
res.render('login')
});

// student profile data only
router.get("/profile", authController.profileData,(req, res) => {
    if(req.student){ // you grap req from database
        res.render('profile',{
        student: req.student    
        })
    }
    else{
        res.redirect('/login') //if someone tried to access without token redirect to login 
    }
        })  

router.get("/profile", authController.isLoggedIn,(req, res) => {
if(req.user){ // you grap req from database
    res.render('profile',{
    user: req.user    
    })
}
else{
    res.redirect('/login') //if someone tried to access without token redirect to login 
}
    }) 
  
module.exports=router;