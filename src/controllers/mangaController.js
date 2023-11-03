const prisma = require("../models/prisma")

exports.manga = async (req,res,next) =>{
    try{
        const mangaWriter = await prisma.writer.findMany({})
        const mangaAll = await prisma.mangaNameNCover.findMany({})
        const mangaAllEpisode = await prisma.mangaEpisode.findMany({})
       
        res.status(201).json({mangaWriter,mangaAll,mangaAllEpisode })


    }catch(error){
        next(error)
    }
}

exports.getManga = async (req,res,next) =>{
    try{
        console.log(req.prarams)
    }catch(error){
        next(error)
    }
}