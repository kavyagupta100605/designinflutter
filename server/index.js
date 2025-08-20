const mongoose = require('mongoose');
const express = require('express');
const authrouter = require('../server/route/signup');

const app = express();

app.use(express.json());
app.use(authrouter);

const PORT = process.env.PORt || 3000;

const db = 'mongodb://localhost:27017/ToDoapp';

mongoose
    .connect(db)
    .then(()=>{
        console.log("connected Successfully");
    })
    .catch((e)=>{
        console.log(e);
    })

app.listen(PORT,"localhost",()=>{
    console.log(`Port is running on ${PORT}`);
})