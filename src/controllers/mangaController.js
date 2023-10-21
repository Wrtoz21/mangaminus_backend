const prisma = require("../models/prisma")

exports.manga = async (req,res,next) =>{
    try{
        const manga = await prisma.manga.findMany({})
        const writer = await prisma.mangaWriter.findMany({})
       
        res.status(201).json({manga,writer})


    }catch(error){
        next(error)
    }
}