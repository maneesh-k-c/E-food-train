const express = require('express');
const mongoose = require("mongoose");
const registerRouter = require('./src/routes/registerRouter');
const deliveryRouter = require('./src/routes/deliveryRouter');
const food_itemModel = require('./src/models/food_itemModel');
const food_itemRouter = require('./src/routes/food_itemRouter');
const orderRouter = require('./src/routes/orderRouter');
const paymentRouter = require('./src/routes/paymentRouter');
const notficationRouter = require('./src/routes/notificationRouter');
const loginRouter = require('./src/routes/loginRouter');


const app = express();


app.use(express.urlencoded({ extended: true }));

app.get('/', function (req, res) {
  res.send("hellossdfsdf");
});
app.use('/register',registerRouter);
app.use('/login',loginRouter);
app.use('/delivery',deliveryRouter);
app.use('/food_item',food_itemRouter);
app.use('/order',orderRouter);
app.use('/payment',paymentRouter);
app.use('/notification',notficationRouter);







mongoose.connect('mongodb+srv://maneeshmaitexa:maneeshmaitexa@cluster0.fv75o1k.mongodb.net/E-trainDB?retryWrites=true&w=majority').then(()=>{
  app.listen(3000, function () {
    console.log("Server started at http://localhost:3000");
  });
}).catch((err)=>{
  console.log(err);
})