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
        const urlCover = await upload(req.files?.mangaPic[0].path)

        await prisma.mangaNameNCover.create({
            data: {
                writer: {
                    create: {
                        writerName: req.body.writerName
                    }
                },
                mangaName: req.body.mangaName,
                mangaCover: urlCover,
                detail: req.body.discribe
            }
        });




        res.status(200).json("Upload Success")

    } catch (err) {
        next(err)
    }
}
exports.uploadEpisode = async (req, res, next) => {
    try {
        console.log(req.body)
        if (!req.body) {
            return next(createError("Please Check your texts"))
        }

        if (!req.files) {
            return next(createError("Please Check your files"))
        }
        const findManga = await prisma.mangaNameNCover.findFirst({
            where: {
                mangaName:req.body.mangaName
            }
        })
        console.log(req.body.mangaName)
        console.log(findManga)
        const urlPage = await upload(req.files.mangaPicPage[0].path)

        if (req.body.mangaName === findManga.mangaName) {
            console.log(req.body.mangaPrice)
            await prisma.mangaEpisode.create({
                data: {
                    // mangaName: req.body.mangaName,
                    // mangaPrice: +req.body.mangaPrice,
                    mangaSrc: urlPage,
                    episode: +req.body.episode,
                    page: +req.body.numberPage,
                    mangaNameNCoverId:findManga.id
                }
            })
        }


        res.status(200).json("Upload Success")

    } catch (err) {
        next(err)
    }
}

exports.adminUpdate = async (req, res, next) => {

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

