const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const prisma = require('../models/prisma');
const { registerSchema, loginSchema } = require('../validators/user-regis&login-validator')
const createError = require('../utils/create-error')

exports.register = async (req, res, next) => {
    try {
        const { value, error } = registerSchema.validate(req.body);
    //    console.log(value, "value")
        if (error) {
            return next(error)
        }
        const checkUsername = await prisma.user.findUnique({
            where:{username:value.username}
        })
        // console.log(checkUsername)
        if(!!checkUsername){
            res.status(400).json({message:"This user already used",fieldError: 'username'})
        }

        const checkEmail = await prisma.user.findUnique({
            where:{email:value.email}
        })
        if(!!checkEmail){
            res.status(400).json({message:"This email already used",fieldError:'email'})
        }

        const checkmobilePhone = await prisma.user.findUnique({
            where:{mobilePhone:value.mobilePhone}
        })
        if(!!checkmobilePhone){
            res.status(400).json({message:"This mobilePhone already used",fieldError:'mobilePhone'})
        }


        value.password = await bcrypt.hash(value.password, 10)
        await prisma.user.create({
            data: value
        })
        res.status(201).json({ message:"Registed" })
    } catch (error) {
        next(error)
        // res.status(400).json({ message: 'Not success' });
    }
}
exports.login = async (req, res, next) => {
    try {
        const { value, error } = loginSchema.validate(req.body);
        if (error) {
            return next(error)
        }
        const user = await prisma.user.findUnique({
            where:{username:value.username}                  
        })
       
        if(!user){
            return next(createError('invalid creadential',400))
        }

        const Matched = await bcrypt.compare(value.password, user.password);
        if(!Matched){
            return next(createError('invalid credential',400))
        }
        const payload = { userId: user.id }
        const accessToken = jwt.sign(
            payload,
            process.env.JWT_SECRET_KEY || 'dkosopdjkopqjfopjnmvpqmnpevw',
            {
                expiresIn: process.env.JWT_EXPIRE
            }
        )
        delete user.password;
        res.status(201).json({accessToken,user})
    } catch (error) {
        next(error)
    }
}