const express = require('express')
const loginModel = require('../models/loginModel')
const userModel = require('../models/userModel')
const restaurantModel = require('../models/restaurantModel')
const pantryModel = require('../models/pantryModel')
const deliveyboyModel = require('../models/deliveryboyModel')


const loginRouter = express.Router()


loginRouter.post('/login', async (req, res) => {
    try {
        const oldUser = await loginModel.findOne({ username: req.body.username})
        if (!oldUser) {
            return res.status(400).json({
                success: false,
                error: true,
                message: "User not found !"
            })
        }
        if (oldUser.password == req.body.password) {
            if (oldUser.role == 0) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    login_id: oldUser._id,
                    details: oldUser
                })
            }
            if (oldUser.role == 1) {
                const user = await userModel.findOne({ login_id: oldUser._id })
                if (user) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        user_id: user._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

            }
            if (oldUser.role == 2) {
                const restaurant= await restaurantModel.findOne({ login_id: oldUser._id })
                if (restaurant) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        restaurant_id: restaurant._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

            }
            if (oldUser.role == 3) {
                const pantry= await pantryModel.findOne({ login_id: oldUser._id })
                if (pantry) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        pantry_id: pantry._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

            }
            if (oldUser.role == 4) {
                const deliveryboy= await deliveyboyModel.findOne({ login_id: oldUser._id })
                if (deliveryboy) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        deliveryboy_id: deliveryboy._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

            }

        } else {
            return res.status(406).json({
                success: false,
                error: true,
                message: "Password not matching!"
            })
        }


    } catch (error) {

    }
})

module.exports = loginRouter