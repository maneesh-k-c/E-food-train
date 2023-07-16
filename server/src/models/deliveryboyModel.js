const mongoose = require("mongoose");

const schema = mongoose.Schema

const deliveyboySchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    restaurant_id: { type: mongoose.Types.ObjectId, ref:'restaurant_tb' },
    firstname: { type: String },
    lastname: { type: String },
    Phone_no: { type: String },
    email: { type: String },
    address: { type: String },
    


})

const deliveyboyModel = mongoose.model('deliveyboy_tb', deliveyboySchema)
module.exports =  deliveyboyModel