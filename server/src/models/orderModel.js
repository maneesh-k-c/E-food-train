const mongoose = require("mongoose");

const schema = mongoose.Schema

const orderSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    food_id: { type: mongoose.Types.ObjectId, ref:'food_item_tb' },
    restaurant_id: { type: mongoose.Types.ObjectId, ref:'restaurant_tb' },
    name: { type: String },
    phone: { type: String },
    train_no: { type: String },
    seat_no: { type: String },
    time: { type: String },
    date: { type: String },
    food_price: { type: String },
    totalAmount: { type: String },
    status: { type: String },

    


})

const orderModel = mongoose.model('order_tb',orderSchema)
module.exports = orderModel