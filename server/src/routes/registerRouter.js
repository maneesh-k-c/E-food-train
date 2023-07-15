const express = require('express');
const loginModel = require('../models/loginModel');
const userModel = require('../models/userModel');
const restaurantModel = require('../models/restaurantModel');
const pantryModel = require('../models/pantryModel');
const deliveyboyModel = require('../models/deliveryboyModel');

const registerRouter = express.Router();


registerRouter.post('/user-register', async function (req, res) {
  try {
    const oldUser = await loginModel.findOne({ username: req.body.user_name })
        if(oldUser){
           return res.status(400).json({
                success:false,
                error:false,
                message:"User already exist"
            })
        }
        const oldPhone = await userModel.findOne({ phone_no: req.body.phone_no })
        if(oldPhone){
           return res.status(400).json({
                success:true,
                error:false,
                message:"Phone number already exist"
            })
        }
   const log_data = {
    username: req.body.user_name,
    password: req.body.password,
    role: 1,
    status: '1',
}
const save_login = await loginModel(log_data).save()
if(save_login){
    const user_data = {
      login_id:save_login._id, 
        firstname: req.body.first_name,
        lastname: req.body.last_name,
        Phone_no: req.body.phone_no,
        address: req.body.address,
        email: req.body.email, 
        password: req.body.password,  
          
        
    }
    const save_user = await userModel(user_data).save()
    if(save_user){
        return res.status(200).json({
             success:true,
             error:false,
             details:save_user,
             message:"Registration completed"
         })
     }
}


} catch (error) {
return res.status(400).json({
    success:true,
    error:false,
    message:"Something went wrong"
})
}
})
registerRouter.post('/restaurant-register', async function (req, res) {
    try {
      const oldUser = await loginModel.findOne({ username: req.body.user_name })
          if(oldUser){
             return res.status(400).json({
                  success:true,
                  error:false,
                  message:"User already exist"
              })
          }
          const oldPhone = await restaurantModel.findOne({ phone_no: req.body.phone_no })
          if(oldPhone){
             return res.status(400).json({
                  success:true,
                  error:false,
                  message:"Phone number already exist"
              })
          }
     const log_data = {
      username: req.body.user_name,
      password: req.body.password,
      role: 2,
      status: '1',
  }
  const save_login = await loginModel(log_data).save()
  if(save_login){
      const restaurant_data = {
        login_id:save_login._id, 
          restaurantname: req.body.name,
          Phone_no: req.body.phone_no,
          location: req.location,    
          email: req.body.email,      
          
      }
      const save_user = await restaurantModel(restaurant_data).save()
      if(save_user){
          return res.status(200).json({
               success:true,
               error:false,
               details:save_user,
               message:"Registration completed"
           })
       }
  }
  
  
  } catch (error) {
  return res.status(400).json({
      success:true,
      error:false,
      message:"Something went wrong"
  })
  }
  })
  
registerRouter.post('/pantry-register', async function (req, res) {
    try {
      const oldUser = await loginModel.findOne({ username: req.body.user_name })
          if(oldUser){
             return res.status(400).json({
                  success:true,
                  error:false,
                  message:"User already exist"
              })
          }
          const oldPhone = await pantryModel.findOne({ phone_no: req.body.phone_no })
          if(oldPhone){
             return res.status(400).json({
                  success:true,
                  error:false,
                  message:"Phone number already exist"
              })
          }
     const log_data = {
      username: req.body.user_name,
      password: req.body.password,
      role: 3,
      status: 0,
  }
  const save_login = await loginModel(log_data).save()
  if(save_login){
      const pantry_data = {
        login_id:save_login._id, 
          train_name: req.body.train_name,
          Phone_no: req.body.phone_no,    
          email: req.body.email,  
            
          
      }
      const save_user = await pantryModel (pantry_data).save()
      if(save_user){
          return res.status(200).json({
               success:true,
               error:false,
               details:save_user,
               message:"Registration completed"
           })
       }
  }
  
  
  } catch (error) {
  return res.status(400).json({
      success:true,
      error:false,
      message:"Something went wrong"
  })
  }
  })
   
registerRouter.post('/deliveryboy-register', async function (req, res) {
    try {
      const oldUser = await loginModel.findOne({ username: req.body.user_name })
          if(oldUser){
             return res.status(400).json({
                  success:true,
                  error:false,
                  message:"User already exist"
              })
          }
          const oldPhone = await deliveyboyModel.findOne({ phone_no: req.body.phone_no })
          if(oldPhone){
             return res.status(400).json({
                  success:true,
                  error:false,
                  message:"Phone number already exist"
              })
          }
     const log_data = {
      username: req.body.user_name,
      password: req.body.password,
      role: 4,
      status: 0,
  }
  const save_login = await loginModel(log_data).save()
  if(save_login){
      const deliveryboy_data = {
        login_id:save_login._id, 
          firstname: req.body.first_name,
          lastname: req.body.last_name,
          Phone_no: req.body.phone_no,    
          email: req.body.email,  
             
          
      }
      const save_user = await deliveyboyModel (deliveryboy_data).save()
      if(save_user){
          return res.status(200).json({
               success:true,
               error:false,
               details:save_user,
               message:"Registration completed"
           })
       }
  }
  
  
  } catch (error) {
  return res.status(400).json({
      success:true,
      error:false,
      message:"Something went wrong"
  })
  }
  })
  
  
  registerRouter.get('/view-restaurantapprove', async function (req, res) {
    try {

        const allUser = await restaurantModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }

            },
            {
                '$match':{
                    "login.status":'1'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    
                   
                    'id':{'$first':'$_id'},
                    'logid':{'$first':'$login._id'},
                     'restaurant_name':{'$first':'$restaurantname'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'status':{'$first':'$login.status'},
                    'location':{'$first':'$location'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    

                    
                }
            }
          ])
        if(!allUser){
           return res.status(400).json({
                success:false,
                error:true,
                message:"No data exist"
            })
        }
        return res.status(200).json({
            success:true,
            error:false,
            data:allUser
        })
        

      
       
    } catch (error) {
        return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})
registerRouter.get('/view-restaurant', async function (req, res) {
    try {

        const allUser = await restaurantModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }

            },
          
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    
                    'logid':{'$first':'$login._id'},
                     'restaurant_name':{'$first':'$restaurantname'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'status':{'$first':'$login.status'},
                    'location':{'$first':'$location'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    

                    
                }
            }
          ])
        if(!allUser){
           return res.status(400).json({
                success:false,
                error:true,
                message:"No data exist"
            })
        }
        return res.status(200).json({
            success:true,
            error:false,
            data:allUser
        })
        

      
       
    } catch (error) {
        return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})
registerRouter.get('/approve/:id', async (req, res) => {
    try {
      const id = req.params.id;
 const approve = await loginModel.updateOne({ _id: id }, { $set: { status: 1 } });
   console.log(approve);
      if (approve && approve.modifiedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User approved',
        });
      } else if (approve && approve.modifiedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already approved',
        });
      } else {
        throw new Error('Error updating user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });
  registerRouter.get('/reject/:id', async (req, res) => {
    try {
      const id = req.params.id;
  
      const reject = await loginModel.deleteOne({ _id: id });
  
      if (reject && reject.deletedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User rejected',
        });
      } else if (reject && reject.deletedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already rejected',
        });
      } else {
        throw new Error('Error deleting user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });
registerRouter.get('/view-deliveryboyapprove', async function (req, res) {
    try {

        const allUser = await deliveyboyModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }

            },
            {
                '$match':{
                    "login.status":'0'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    
                   
                    'id':{'$first':'$_id'},
                    'logid':{'$first':'$login._id'},
                    'first_name':{'$first':'$firstname'},
                    'last_name':{'$first':'$lastname'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'status':{'$first':'$login.status'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    

                    
                }
            }
          ])
        if(!allUser){
           return res.status(400).json({
                success:false,
                error:true,
                message:"No data exist"
            })
        }
        return res.status(200).json({
            success:true,
            error:false,
            data:allUser
        })
        

      
       
    } catch (error) {
        return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})
registerRouter.get('/view-deliveryboy', async function (req, res) {
    try {

        const allUser = await deliveyboyModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }

            },
            {
                '$match':{
                    "login.status":'1'
                }
            },
          
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    
                    'logid':{'$first':'$login._id'},
                    'first_name':{'$first':'$firstname'},
                    'last_name':{'$first':'$lastname'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'status':{'$first':'$login.status'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    

                    
                }
            }
          ])
        if(!allUser){
           return res.status(400).json({
                success:false,
                error:true,
                message:"No data exist"
            })
        }
        return res.status(200).json({
            success:true,
            error:false,
            data:allUser
        })
        

      
       
    } catch (error) {
        return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})
registerRouter.get('/approve/:id', async (req, res) => {
    try {
      const id = req.params.id;
 const approve = await loginModel.updateOne({ _id: id }, { $set: { status: 4 } });
   console.log(approve);
      if (approve && approve.modifiedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User approved',
        });
      } else if (approve && approve.modifiedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already approved',
        });
      } else {
        throw new Error('Error updating user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });
  registerRouter.get('/reject/:id', async (req, res) => {
    try {
      const id = req.params.id;
  
      const reject = await loginModel.deleteOne({ _id: id });
  
      if (reject && reject.deletedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User rejected',
        });
      } else if (reject && reject.deletedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already rejected',
        });
      } else {
        throw new Error('Error deleting user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });
registerRouter.get('/view-user', async (req, res) => {
  try {
      const users = await userModel.find()
      if(users[0]!=undefined){
          return res.status(200).json({
              success:true,
              error:false,
              data:users
          })
      }else{
          return res.status(400).json({
              success:false,
              error:true,
              message:"No data found"
          })
      }
  } catch (error) {
      return res.status(400).json({
          success:false,
          error:true,
          message:"Something went wrong",
          details:error
      })
    }
    })
module.exports = registerRouter;