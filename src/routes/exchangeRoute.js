const express = require('express')
const router = express.Router();
const exchangeController = require('../controllers/exchangeController')
const uploadMiddleware = require('../middlewares/upload');
const authenticate = require('../middlewares/authenticate');

router.post('/AddExchangeRate',exchangeController.AddEchangeRate)
router.get('/getTableExchangeRate',exchangeController.getTable)
router.post('/payment',authenticate,uploadMiddleware.fields([
    { name:'slip',maxCount:10}
]),exchangeController.uploadSlipToBack)
module.exports = router