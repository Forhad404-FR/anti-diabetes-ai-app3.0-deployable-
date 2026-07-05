const mongoose = require("mongoose");

const glucoseSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },

  glucoseLevel: {
    type: Number,
    required: true,
  },

  measurementType: {
    type: String,
    enum: ["fasting", "after_meal", "random"],
    required: true,
  },

  date: {
    type: Date,
    default: Date.now,
  },

  notes: String,
}, { timestamps: true });

module.exports = mongoose.model("Glucose", glucoseSchema);