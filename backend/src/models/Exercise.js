const mongoose = require("mongoose");

const exerciseSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },

  type: {
    type: String,
    required: true,
  },

  duration: {
    type: Number, // minutes
    required: true,
  },

  caloriesBurned: Number,

  intensity: {
    type: String,
    enum: ["low", "medium", "high"],
  },

  date: {
    type: Date,
    default: Date.now,
  },
}, { timestamps: true });

module.exports = mongoose.model("Exercise", exerciseSchema);