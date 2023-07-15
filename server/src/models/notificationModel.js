const mongoose = require("mongoose");

const schema = mongoose.Schema

const notificationSchema = new schema({
    order_id: { type: mongoose.Types.ObjectId, ref:'order_tb' },
    notification_id: { type: String },
    date: { type: String },


})

const notificationModel = mongoose.model('notification_tb',notificationSchema)
module.exports = notificationModel