const mongoose = require("mongoose");

const schema = mongoose.Schema

const food_itemSchema = new schema({
    restaurant_id: { type: mongoose.Types.ObjectId,ref:'restaurant_tb' },
    item_name: { type: String },
    price: { type: String },
    item_image: { type: String },


})

const food_itemModel = mongoose.model('food_item_tb',food_itemSchema)
module.exports = food_itemModel