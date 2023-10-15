const { checkUserIdSchema } = require("../validators/user-validate");
const prisma = require("../models/prisma");


exports.getUserById = async (req,res,next) => {
    try{
        const {error} = checkUserIdSchema.validate(req.params);
        if(error){
            return next(error);
        }
        const userId = +req.params.userProfileId
        console.log(userId)
        const user = await prisma.user.findUnique({
            where:{id:userId}
        });
        // let status = null;
        // let friends = null;
        if(user){
            delete user.password;
        }
        res.status(200).json({user})
    }catch(err){
        next(err)
    }
}