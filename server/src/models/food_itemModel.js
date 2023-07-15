const mongoose = require("mongoose");

const schema = mongoose.Schema

const food_itemSchema = new schema({
    item_id: { type: String },
    item_name: { type: String },
    price: { type: String },
    item_image: { type: String },


})

const food_itemModel = mongoose.model('food_item_tb',food_itemSchema)
module.exports = food_itemModel