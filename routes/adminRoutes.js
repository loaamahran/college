const express = require('express');
const adminController = require('./../controllers/adminController');

const router = express.Router();

router.route('/login').get(adminController.getlogin).post(adminController.postlogin);

router.route('/register').get(adminController.getRegister).post(adminController.postRegister);



module.exports = router;