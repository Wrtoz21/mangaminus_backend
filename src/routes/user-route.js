const express = require('express');
const authenController = require('../controllers/authen-controller')
const router = express.Router();

router.post('/register',authenController.register)
router.post('/login',authenController.login)
// router.post('/login',authenController.login)

module.exports = router