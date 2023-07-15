const express = require('express');
const deliveryModel = require('../models/deliveryModel');

const deliveryRouter = express.Router();

deliveryRouter.post('/delivery', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      delivey_id: req.body.delivery_id,
      name: req.body.name,
      mobile_no: req.body.mobile_no,
      train_name: req.body.train_name,
      pnr_no: req.body.pnr_no,
      time: req.body.time,
      total: req.body.total,
      date: req.body.date,
      status: req.body.status,
    };

    const savedData = await deliveryModel(data).save();
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

module.exports = deliveryRouter;