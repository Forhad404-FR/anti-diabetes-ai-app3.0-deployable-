const mongoose = require("mongoose");
const app = require("../src/app");
require("dotenv").config();

let isConnected;

const connectToDatabase = async () => {
  if (isConnected) {
    return Promise.resolve();
  }
  
  try {
    const db = await mongoose.connect(process.env.MONGO_URI);
    isConnected = db.connections[0].readyState;
  } catch (error) {
    console.error("DB connection error:", error);
  }
};

// Add connection middleware before any routes are executed
app.use(async (req, res, next) => {
  await connectToDatabase();
  next();
});

module.exports = app;
