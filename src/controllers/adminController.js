const prisma = require("../models/prisma")
const { upload } = require("../utils/cloudinary-service")

exports.upload = async (req, res, next) => {
    try {
        console.log(req.body)
        if (!req.body) {
            return next(createError("Please Check your texts"))
        }

        console.log(req.files)
        if (!req.files) {
            return next(createError("Please Check your files"))
        }
        const urlCover = await upload(req.files.mangaPic[0].path)
        const urlPage = await upload(req.files.mangaPicPage[0].path)
        console.log(typeof (urlPage))


            await prisma.mangaWriter.create({
                data: {
                    writeName: req.body.writerName,
                    imageCover: urlCover,
                    detail: req.body.discribe
                }
            })
        

        if (urlPage) {
            await prisma.manga.create({
                data: {
                    mangaName: req.body.mangaName,
                    mangaPrice: +req.body.mangaPrice,
                    mangaPage: urlPage,
                }
            })
        }

        res.status(200).json("Upload Success")

    } catch (err) {
        next(err)
    }
}

//userCoin: req.body.coin.Coin
exports.adminUpdate = async (req, res, next) => {
    // console.log(+req.body.userSelect.User)
    try {
        await prisma.userWallet.update({
            where: {
                userId: +req.body.userSelect.User
            },
            data: {
                userCoin: +req.body.coin.Coin
            }
        })

        res.status(200).json("Updated")
    } catch (err) {
        return next(err)
    }
}

