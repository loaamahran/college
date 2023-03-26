const express = require("express");
const studentController = require("../controllers/student");
const router = express.Router();
// NOTE: to hit this endpoint you need to do this
// localhost:5000/student/student/sections
router.get("/student/courses", studentController.courses);
router.get("/student/sections", studentController.sections);
//router.post('/student/courses',studentController.courses);
module.exports = router;
