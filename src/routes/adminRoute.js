const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const authenticate = require('../middlewares/authenticate');
const uploadMiddleware = require('../middlewares/upload')

router.post('/upload',authenticate,uploadMiddleware.fields([
    { name:'mangaPic',maxCount:1},
    { name:'mangaPicPage',maxCount:30}]),adminController.upload)
router.patch('/updateUser',adminController.adminUpdate)


module.exports = router