require('dotenv').config();
const express = require('express');
const cors = require('cors')
const morgan  = require('morgan')


const userRoute = require('./routes/user-route');


const app = express();

app.use(cors())
app.use(morgan('manga'))
app.use(express.json())

app.use('/user',userRoute)


const PORT = process.env.PORT || 1000;
app.listen(PORT,() => console.log(`server running on port:${PORT}`))
