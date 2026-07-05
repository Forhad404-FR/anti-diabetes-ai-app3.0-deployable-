const mongoose = require("mongoose");

const doctorSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },

  email: {
    type: String,
    required: true,
    unique: true,
  },

  specialization: String,

  hospitalName: String,

  experienceYears: Number,

  patients: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  }],

  contactNumber: String,
}, { timestamps: true });

module.exports = mongoose.model("Doctor", doctorSchema);