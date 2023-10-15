 const Joi = require('joi')
 
 const checkUserIdSchema = Joi.object({
   userProfileId:Joi.number().integer().positive().required()
 })

 exports.checkUserIdSchema = checkUserIdSchema