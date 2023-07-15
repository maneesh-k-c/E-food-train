const express = require('express');
const orderModel = require('../models/orderModel');

const orderRouter = express.Router();

orderRouter.post('/order', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id, 
   
      order_id: req.body.order_id,  
      name: req.body.name,
      mobile_no: req.body.mobile_no,  
      train_name: req.body.train_name,
      pnr_no: req.body.pnr_no,  
      time: req.body.time,
      date: req.body.date,  
      total: req.body.total,  
      status: req.body.status,
    };

    const savedData = await orderModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Registration completed"
      });
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong"
    });
  }
});

module.exports = orderRouter;