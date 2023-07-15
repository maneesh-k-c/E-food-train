const express = require('express');
const notificationModel = require('../models/notificationModel');

const notficationRouter = express.Router();

notficationRouter.post('/notification', async function (req, res) {
  try {
    const data = {
      order_id: req.body.order_id,
      date: req.body.date,
    };

    const notification = new notificationModel(data);
    const savedData = await notification.save();
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

module.exports = notficationRouter;
