const prisma = require("../models/prisma")
const { upload } = require("../utils/cloudinary-service")
const createError = require("../utils/create-error")
const { exchangeRateSchema } = require("../validators/exchange-validate")

exports.AddEchangeRate = async (req, res, next) => {
    try {
        const { value, error } = exchangeRateSchema.validate(req.body)
        // console.log(value)
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
        console.log(value)
        const check = await prisma.exchangeRate.findMany({

        })
        console.log(check)

        res.send({ check })
    } catch (error) {
        next(error)
    }
}


exports.uploadSlipToBack = async (req, res, next) => {
    try {
        // console.log(req)

        if (!req.files) {
            return next(createError("Please upload payment"))
        }
        if (req.files.slip) {
            const url = await upload(req.files.slip[0].path)
            const payment = await prisma.payment.create({
                data: {
                    paymentImage: url
                }
            })
            await prisma.userWallet.findFirst({
                where: { userId: req.user.id }
            })
            await prisma.coinExchange.create({
                data:
                {
                    paymentId: payment.id,
                    userWalletId: req.user.id
                }

            })

        }
        res.status(200).json("Upload Success")

    } catch (error) {
        next(error)
    }
}

