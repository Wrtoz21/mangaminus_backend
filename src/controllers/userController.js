const { checkUserIdSchema } = require("../validators/user-validate");
const prisma = require("../models/prisma");


exports.getUserById = async (req,res,next) => {
    try{
        const {error} = checkUserIdSchema.validate(req.params);
        if(error){
            return next(error);
        }
        const userId = +req.params.userProfileId
        const user = await prisma.user.findFirst({
            where:{id:userId}
            });
            console.log(user)
            const wallet = await prisma.userWallet.findFirst({
                where:{userId:user.id}
            })
        if(user){
            delete user.password;
        }
        res.status(200).json({user,wallet})
    }catch(err){
        next(err)
    }
}

