require("dotenv").config();
const app = require("./src/app");
const { port } = require("./src/config/env");
const mongoose = require("mongoose");

// Debug (optional)
console.log("MONGO_URI loaded");

// MongoDB Connection + Start Server
mongoose.connect(process.env.MONGO_URI)
  .then(() => {
    console.log("MongoDB Connected Successfully");

    app.listen(port, () => {
      console.log(`Server running on port ${port}`);
    });
  })
  .catch((err) => {
    console.log("DB Connection Failed:", err.message);
  });