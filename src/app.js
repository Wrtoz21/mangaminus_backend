require('dotenv').config();
const express = require('express');
const cors = require('cors')
const morgan  = require('morgan')
console.clear()

const userRoute = require('./routes/user-route');
const exchangeRoute = require('./routes/exchangeRoute')

const app = express();

app.use(cors())
app.use(morgan('manga'))
app.use(express.json())
app.use(express.static('public'));


app.use('/user',userRoute)
app.use('/coin-exchange',exchangeRoute)




const PORT = process.env.PORT || 1000;
app.listen(PORT,() => console.log(`server running on port:${PORT}`))
