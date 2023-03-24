const express = require('express');
const studentController=require('../controllers/student')
const router = express.Router();
router.get('/student/courses',studentController.courses);
router.get('/student/sections',studentController.sections);
//router.post('/student/courses',studentController.courses);
module.exports=router;