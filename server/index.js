//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require('mongoose');
//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");

//INIT
// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://holequoctin:holequoctin111@cluster0.bnkpird.mongodb.net/?retryWrites=true&w=majority";
//middleware
app.use(express.json());
app.use(authRouter);
//Connnections
mongoose
    .connect(DB)
    .then(() =>{
        console.log('Connect Successful');
}).catch(e =>{
    console.log(e);
})

app.listen(PORT,"0.0.0.0",() => {
    console.log(`connected a port ${PORT}`);
});