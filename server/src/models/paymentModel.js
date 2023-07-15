const mongoose = require("mongoose");

const schema = mongoose.Schema

const paymentSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    order_id: { type: mongoose.Types.ObjectId, ref:'order_tb' },
    item_id: { type: mongoose.Types.ObjectId, ref:'item_tb' },
    bill_no: { type: String },
    date: { type: String },
    total_amount: { type: String },
    status: { type: String },

    


})

const paymentModel = mongoose.model('payment_tb',paymentSchema)
module.exports = paymentModel