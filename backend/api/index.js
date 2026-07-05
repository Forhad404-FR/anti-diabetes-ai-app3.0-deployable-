require("dotenv").config();
const mongoose = require("mongoose");
const app = require("../src/app");

// Cache the DB connection across serverless function invocations
let cachedConnection = null;

async function connectToDatabase() {
  if (cachedConnection && mongoose.connection.readyState === 1) {
    return cachedConnection;
  }

  // Disconnect stale connections
  if (mongoose.connection.readyState !== 0) {
    await mongoose.disconnect();
  }

  cachedConnection = await mongoose.connect(process.env.MONGO_URI, {
    serverSelectionTimeoutMS: 10000,
    socketTimeoutMS: 45000,
  });

  console.log("MongoDB Connected Successfully");
  return cachedConnection;
}

// Vercel serverless handler
module.exports = async (req, res) => {
  try {
    await connectToDatabase();
  } catch (err) {
    console.error("DB connection failed:", err.message);
    return res.status(500).json({ success: false, message: "Database connection failed: " + err.message });
  }

  // Hand off to the Express app
  return app(req, res);
};
