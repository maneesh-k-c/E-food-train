const mongoose = require("mongoose");

const schema = mongoose.Schema

const orderSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    order_id: { type: String },
    name: { type: String },
    mobile_no: { type: String },
    train_name: { type: String },
    pnr_no: { type: String },
    seat_no: { type: String },
    time: { type: String },
    date: { type: String },
    total: { type: String },
    status: { type: String },

    


})

const orderModel = mongoose.model('order_tb',orderSchema)
module.exports = orderModel