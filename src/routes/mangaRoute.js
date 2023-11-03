const express = require('express');
const router = express.Router();
const mangaController = require('../controllers/mangaController')


router.get('/mangaAll',mangaController.manga)
router.get('/:mangaName',mangaController.getManga)

module.exports = router;