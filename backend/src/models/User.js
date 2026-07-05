const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },

  email: {
    type: String,
    required: true,
    unique: true,
  },

  password: {
    type: String,
    required: true,
  },

  role: {
    type: String,
    enum: ["patient", "doctor", "admin"],
    default: "patient",
  },

  age: Number,

  gender: {
    type: String,
    enum: ["male", "female", "other"],
  },

  height: Number,
  weight: Number,

  diabetesType: String,

  assignedDoctor: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Doctor",
  },
}, { timestamps: true });

module.exports = mongoose.model("User", userSchema);