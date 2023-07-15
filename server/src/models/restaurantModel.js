const mongoose = require("mongoose");

const schema = mongoose.Schema

const restaurantSchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    restaurantname: { type: String },
    Phone_no: { type: String },
    location: { type: String },
    email: { type: String },

    


})

const restaurantModel = mongoose.model('restaurant_tb',restaurantSchema)
module.exports = restaurantModel