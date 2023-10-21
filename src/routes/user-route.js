const express = require('express');
const userController = require('../controllers/userController')
const authenController = require('../controllers/authenController')
const router = express.Router();
const authenticateMiddleware = require('../middlewares/authenticate')


router.post('/register',authenController.register)
router.post('/login',authenController.login)
router.get('/me',authenticateMiddleware,authenController.getMe)
router.get('/:userProfileId',authenticateMiddleware,userController.getUserById)

module.exports = router