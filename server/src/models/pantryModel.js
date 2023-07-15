const mongoose = require("mongoose");

const schema = mongoose.Schema

const pantrySchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    trainname: { type: String },
    Phone_no: { type: String },
    email: { type: String },
    password: { type: String },
    


})

const pantryModel = mongoose.model('pantry_tb',pantrySchema)
module.exports = pantryModel