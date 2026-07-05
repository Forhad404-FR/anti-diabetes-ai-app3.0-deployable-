const reportService = require("../services/report.service");
const aiEngine = require("../services/ai/aiEngine.service");

const Glucose = require("../models/Glucose");
const Diet = require("../models/Diet");
const Exercise = require("../models/Exercise");

exports.getWeeklyReport = async (req, res) => {
  try {
    const userId = req.user.userId;

    const weeklyReport = await reportService.getWeeklyReport(userId);

    const glucoseData = await Glucose.find({ user: userId })
      .sort({ date: -1 })
      .limit(30);

    const dietData = await Diet.find({ user: userId })
      .sort({ date: -1 })
      .limit(20);

    const exerciseData = await Exercise.find({ user: userId })
      .sort({ date: -1 })
      .limit(20);

    const aiResult = aiEngine.generateAIReport({
  glucoseData,
  dietData,
  exerciseData,
  dietSummary: dietData
    .map(d => (d.foodItems || []).join(" ") || d.mealType || "")
    .join(", "),
  exerciseSummary: exerciseData
    .map(e => `${e.type} ${e.duration || 0}min`)
    .join(", ")
});
    console.log("AI RESULT:", aiResult);
    console.log("GLUCOSE COUNT:", glucoseData.length);
    console.log("DIET COUNT:", dietData.length);
    console.log("EXERCISE COUNT:", exerciseData.length);

    res.status(200).json({
      success: true,
      message: "Weekly report generated",
      data: {
        weeklyReport,
        aiAnalysis: aiResult
      }
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};