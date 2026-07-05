const mongoose = require("mongoose");

const reportSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },

  averageGlucose: Number,

  riskLevel: {
    type: String,
    enum: ["low", "medium", "high"],
  },

  dietSummary: String,

  exerciseSummary: String,

  recommendation: String,

  generatedBy: {
    type: String,
    enum: ["AI", "doctor", "system"],
    default: "AI",
  },

  date: {
    type: Date,
    default: Date.now,
  },
}, { timestamps: true });

module.exports = mongoose.model("Report", reportSchema);