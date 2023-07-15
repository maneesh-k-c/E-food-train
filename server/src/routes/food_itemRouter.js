const express = require('express');
const food_itemModel = require('../models/food_itemModel');
const multer = require('multer');

const food_itemRouter = express.Router();

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./public/images/");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});

var upload = multer({ storage: storage });

food_itemRouter.post('/upload', upload.single("file"), (req, res) => {
  console.log("jh", req.file.filename);
  return res.json("file uploaded");
});

food_itemRouter.get('/view-item', async (req, res) => {
  try {
    const items = await food_itemModel.find();
    if (items.length > 0) {
      return res.status(200).json({
        success: true,
        error: false,
        data: items
      });
    } else {
      return res.status(400).json({
        success: false,
        error: true,
        message: "No data found"
      });
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong",
      details: error
    });
  }
});

food_itemRouter.post('/food_item', async function (req, res) {
  try {
    const data = {
      item_id: req.body.item_id,
      item_name: req.body.item_name,
      price: req.body.price,
      item_image: req.body.item_image,
    };

    const savedData = await food_itemModel.create(data);
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

food_itemRouter.get('/view-single/:id', async function (req, res) {
  try {
    const item_id = req.params.id;
    const item = await food_itemModel.findOne({ _id: item_id });

    if (!item) {
      return res.status(400).json({
        success: false,
        error: true,
        message: "No data exists"
      });
    }

    return res.status(200).json({
      success: true,
      error: false,
      data: item
    });

  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong"
    });
  }
});

food_itemRouter.post('/update-single-item/:id', async function (req, res) {
  try {
    const item_id = req.params.id;
    const details = {
      item_name: req.body.item_name,
      price: req.body.price,
      item_image: req.body.item_image,
    };

    const item = await food_itemModel.findByIdAndUpdate(item_id, details);

    if (!item) {
      return res.status(400).json({
        success: false,
        error: true,
        message: "Data not updated"
      });
    }

    return res.status(200).json({
      success: true,
      error: false,
      data: item,
      message: "Data updated"
    });

  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong"
    });
  }
});

food_itemRouter.post('/delete-single/:id', async function (req, res) {
  try {
    const item_id = req.params.id;

    const item = await food_itemModel.findByIdAndDelete(item_id);

    if (!item) {
      return res.status(400).json({
        success: false,
        error: true,
        message: "Data not deleted"
      });
    }

    return res.status(200).json({
      success: true,
      error: false,
      data: item,
      message: "Data deleted"
    });

  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong"
    });
  }
});

module.exports = food_itemRouter;
