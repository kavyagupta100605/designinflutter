const express = require('express');
const mongoose = require('mongoose');
const authrouter = express.Router();
const bcryptjs = require('bcryptjs');
const User = require('../model/user');
const jwt = require('jsonwebtoken');

//signup
authrouter.post('/api/signup', async (req,res) => {
    try {
        const{name,email,password} = req.body;
        const existinguser = User.findOne({ email });
        if(existinguser)
        {
            return res
                .status(400)
                .json({msg:"User with same email already exists"});
        }

        const hashedpassword = await bcryptjs.hash(password,8);
        const newuser = new User({
            email,
            password:hashedpassword,
            name,
        });
        await newuser.save();
        res.json(newuser);
    } catch (e) {
        res.status(500).json({error: e.msg});
    }
    
})

module.exports=authrouter;

//signin
authrouter.post("/api/signin",async (req,res) => {
    try {
        const {email,password} = req.body;
        const user = await User.findOne({email});
        if(!user)
        {
            return res 
                .status(400)
                .json({msg: "User with this email does not exist"});
        }
        const ismatch = await bcryptjs.compare(password,user.password);
        if(!ismatch)
        {
            return res
                .status(400)
                .json({msg:"Incorrect Password"});
        }

        const token = jwt.sign({id: user._id},"passwordkey");
        res.json({ token, ...user._doc });

    } catch (e) {
        res.status(500).json({error: e.msg});
    }
    
})