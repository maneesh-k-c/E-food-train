const express = require('express');
const PaymentModel = require('../models/paymentModel');

const paymentRouter = express.Router();

paymentRouter.post('/payment', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,
      order_id: req.body.order_id,
      item_id: req.body.item_id,
      bill_no: req.body.bill_no,
      date: req.body.date,
      total_amount: req.body.total,
      status: req.body.status,
    };

    const payment = new PaymentModel(data);
    const savedData = await payment.save();
    console.log(savedData);

    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Registration completed",
      });
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong",
    });
  }
});

module.exports = paymentRouter;
