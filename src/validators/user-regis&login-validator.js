const Joi = require('joi')

const registerSchema = Joi.object({
    username:Joi.string().trim().required(),
    password:Joi.string().pattern(/^[a-zA-Z0-9]{6,20}$/).trim().required(),
    email:Joi.string().trim().email().required(),
    mobilePhone:Joi.string().pattern(/^[0-9]{10}$/).trim().required(),
})

exports.registerSchema = registerSchema


const loginSchema = Joi.object({
    username:Joi.string().required(),
    password:Joi.string().required()
});

exports.loginSchema = loginSchema;