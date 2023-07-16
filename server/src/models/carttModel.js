const mongoose = require("mongoose");

const schema = mongoose.Schema

const cartSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    food_id: { type: mongoose.Types.ObjectId, ref:'food_item_tb' },
    restaurant_id: { type: mongoose.Types.ObjectId, ref:'restaurant_tb' },
    quantity: { type: String },
    status: { type: String }
})

const cartModel = mongoose.model('cart_tb',cartSchema)
module.exports =cartModel