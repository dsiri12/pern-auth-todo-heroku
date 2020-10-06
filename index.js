const express = require("express");
const app = express();
const cors = require("cors");
const path = require("path");

//process.env.PORT
//process.env.NODE_ENV => production or undefined

//middleware

app.use(express.json()); //req.body
app.use(cors());

// app.use(express.static(path.join(__dirname, "client/build")));
app.use(express.static("./client/build"));

if (process.env.NODE_ENV === "production") {
    //server static content
    //npm run build
    app.use(express.static(path.join(__dirname, "client/build")));
}

console.log(__dirname);
console.log(path.join(__dirname, "client/build"));

app.use(express.static("./client/build")); // uncomment for local test
if(process.env.NODE_ENV === "production") {
    //server static content
    //npm run build
    app.use(express.static(path.join(__dirname, "client/build")));
}

//ROUTES//

//register and login routes

app.use("/auth", require("./routes/jwtAuth"));
app.use("/dashboard", require("./routes/dashboard"));

app.get("*", (req,res) => {
    res.sendFile(path.join(__dirname, "client/build/index.html"));
});

const port = process.env.PORT || 5000;
app.listen(port, () => {
    console.log(`server has started on port ${port}`);
});
