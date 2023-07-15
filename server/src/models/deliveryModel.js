const mongoose = require("mongoose");

const schema = mongoose.Schema

const deliverySchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    delivery_id: { type: String },
    name: { type: String },
    mobile_no: { type: String },
    train_name: { type: String },
    pnr_no: { type: String },
    time: { type: String },
    total: { type: String },
    date: { type: String },
    status: { type: String },

    


})

const deliveryModel = mongoose.model('delivery_tb',deliverySchema)
module.exports = deliveryModel