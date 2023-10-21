const prisma = require("../models/prisma")
const { upload } = require("../utils/cloudinary-service")
const createError = require("../utils/create-error")
const { exchangeRateSchema } = require("../validators/exchange-validate")

exports.AddEchangeRate = async (req, res, next) => {
    try {
        const { value, error } = exchangeRateSchema.validate(req.body)
        res.send('Okay')
        await prisma.exchangeRate.create({
            data: value
        })
    } catch (error) {
        next(error)
    }
}
exports.getTable = async (req, res, next) => {
    try {

        const { value } = req.body
        const check = await prisma.exchangeRate.findMany({

        })

        res.send({ check })
    } catch (error) {
        next(error)
    }
}


exports.uploadSlipToBack = async (req, res, next) => {
    try {
        if (!req.files) {
            return next(createError("Please upload payment"))
        }

            const url = await upload(req.files.slip[0].path)
            const c = await prisma.payment.create({
                data:{
                    userWalletId:+req.body.userWalletId,
                    paymentImage:url
                }
            })

        res.status(200).json("Upload Success")

    } catch (error) {
        next(error)
    }
}

