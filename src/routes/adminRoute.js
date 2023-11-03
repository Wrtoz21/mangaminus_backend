const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const authenticate = require('../middlewares/authenticate');
const uploadMiddleware = require('../middlewares/upload')

router.post('/upload', authenticate, uploadMiddleware.fields([
    { name: 'mangaPic', maxCount: 1 }]), adminController.upload)
    
router.post('/uploadEpisode', authenticate, uploadMiddleware.fields([
    { name: 'mangaPicPage', maxCount: 30 }]), adminController.uploadEpisode)

router.patch('/updateUser', adminController.adminUpdate)

module.exports = router