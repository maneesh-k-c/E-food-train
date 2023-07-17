const express = require('express');
const orderModel = require('../models/orderModel');
const cartModel = require('../models/carttModel');
const mongoose = require('mongoose');
const food_itemModel = require('../models/food_itemModel');

const obj = mongoose.Types.ObjectId

const orderRouter = express.Router();

orderRouter.get('/quantity-decrement/:id', async (req, res) => {
  try {
    const id = req.params.id
    const old = await cartModel.findOne({ _id: id })
    const counts = old.count + 1

    const add = await cartModel.updateOne({ _id: id }, { $set: { count: counts } })

    if (add.modifiedCount === 1) {
      const old_product = await food_itemModel.findOne({ _id: old.food_id })
      const available_counts = parseInt(old_product.quantity) + 1
      const products = await food_itemModel.updateOne({ _id: old.food_id }, { $set: { quantity: available_counts } })

      return res.status(201).json({
        success: true, error: false,
        message: "Quantity incremented"
      })
    } else {
      return res.status(400).json({
        success: false, error: true,
        message: "error"
      })
    }
  }
  catch (err) {
    res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
    console.log(err)
  }
})
orderRouter.get('/quantity-increment/:id', async (req, res) => {
  try {
    const id = req.params.id
    const old = await cartModel.findOne({ _id: id })
    const counts = old.count + 1

    const add = await cartModel.updateOne({ _id: id }, { $set: { count: counts } })

    if (add.modifiedCount === 1) {
      const old_product = await food_itemModel.findOne({ _id: old.food_id })
      const available_counts = parseInt(old_product.quantity) - 1
      const products = await food_itemModel.updateOne({ _id: old.food_id }, { $set: { quantity: available_counts } })

      return res.status(201).json({
        success: true, error: false,
        message: "Quantity incremented"
      })
    } else {
      return res.status(400).json({
        success: false, error: true,
        message: "error"
      })
    }
  }
  catch (err) {
    res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
    console.log(err)
  }
})

orderRouter.get('/delete-cart/:id', async function (req, res) {
  try {
    const id = req.params.id;

    const item = await cartModel.deleteOne({_id:id});

    if (item.deletedCount==1) {
      return res.status(200).json({
        success: true,
        error: false,
        message: "Cart item deleted"
      });
    }else{
      return res.status(400).json({
        success: false,
        error: true,
        message: "Something went wrong"
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

orderRouter.get('/view-cart/:id', async function (req, res) {
  try {
    const id = req.params.id
    const allUser = await cartModel.aggregate([
      {
        '$lookup': {
          'from': 'user_tbs',
          'localField': 'user_id',
          'foreignField': '_id',
          'as': 'user'
        }

      },
      {
        '$lookup': {
          'from': 'restaurant_tbs',
          'localField': 'restaurant_id',
          'foreignField': '_id',
          'as': 'restaurant'
        }

      },
      {
        '$lookup': {
          'from': 'food_item_tbs',
          'localField': 'food_id',
          'foreignField': '_id',
          'as': 'food'
        }

      },
      {
        '$unwind': "$user"
      },
      {
        '$unwind': "$food"
      },
      {
        '$unwind': "$restaurant"
      },
      {
        '$match': {
          "status": '0'
        }
      },
      {
        '$match': {
          "user_id": new obj(id)
        }
      },
      {
        '$group': {
          '_id': '$_id',
          'user_id': { '$first': '$user_id' },
          'food_id': { '$first': '$food_id' },
          'restaurant_id': { '$first': '$restaurant_id' },
          'quantity': { '$first': '$quantity' },
          'item_name': { '$first': '$food.item_name' },
          'price': { '$first': '$food.price' },
          'item_image': { '$first': '$food.item_image' },
          'status': { '$first': '$status' },
         
        }
      }
    ])

    allUser.forEach((item) => {
      item.total = item.price * item.quantity;
    });

    let totalPrice = 0;
  
  for (let i = 0; i < allUser.length; i++) {
    totalPrice += allUser[i].total;
  }

    if (!allUser) {
      return res.status(400).json({
        success: false,
        error: true,
        message: "No data exist"
      })
    }
    return res.status(200).json({
      success: true,
      error: false,
      totalPrice:totalPrice,
      data: allUser,
     
    })




  } catch (error) {
    return res.status(400).json({
      success: true,
      error: false,
      message: "Something went wrong"
    })
  }
})

orderRouter.post('/add-cart', async function (req, res) {
  try {

    const oldUser = await cartModel.findOne({ user_id: req.body.user_id,food_id: req.body.food_id,restaurant_id: req.body.restaurant_id,status: '0' })
    if (oldUser) {
      return res.status(400).json({
        success: false,
        error: false,
        message: "Item already in cart"
      })
    }

    const data = {
      user_id: req.body.user_id,    
      food_id: req.body.food_id,  
      restaurant_id: req.body.restaurant_id,
      quantity: 1, 
      status: '0',
    };

    const savedData = await cartModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Item added to cart"
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