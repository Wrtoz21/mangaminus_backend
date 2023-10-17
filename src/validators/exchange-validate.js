const Joi = require('joi')

const exchangeRateSchema = Joi.object({
    bath:Joi.number(),
    coin:Joi.number()
})

exports.exchangeRateSchema = exchangeRateSchema