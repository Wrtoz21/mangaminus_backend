const express = require('express');
const router = express.Router();
const mangaController = require('../controllers/mangaController')


router.get('/mangaAll',mangaController.manga)

module.exports = router;