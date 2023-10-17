const createError = require('../utils/create-error');
const jwt = require('jsonwebtoken');
const prisma = require('../models/prisma');

module.exports = async (req, res, next) => {
  try {
    const authorization = req.headers.authorization;
    if (!authorization || !authorization.startsWith('Bearer ')) {
      return next(createError('unauthenticated', 401));
    }
    // console.log(authorization)
    const token = authorization.split(' ')[1];
    console.log(token)
    const payload = jwt.verify(token, process.env.JWT_SECRET_KEY || 'mnbvcxz');
    console.log(payload)
    const user = await prisma.user.findUnique({
      where: {
        id: payload.userId
      }
    });
    

    if (!user) {
      return next(createError('unauthenticated', 401));
    }
    delete user.password;
    req.user = user;
    
    next();
  } catch (err) {
    if (err.name === 'TokenExpiredError' || err.name === 'JsonWebTokenError') {
      err.statusCode = 401;
    }
    next(err);
  }
};