const Glucose = require("../models/Glucose");
const Diet = require("../models/Diet");
const Exercise = require("../models/Exercise");

exports.getWeeklyReport = async (userId) => {
  const last7Days = new Date();
  last7Days.setDate(last7Days.getDate() - 7);

  const glucose = await Glucose.find({
    user: userId,
    date: { $gte: last7Days },
  });

  const diet = await Diet.find({
    user: userId,
    createdAt: { $gte: last7Days },
  });

  const exercise = await Exercise.find({
    user: userId,
    createdAt: { $gte: last7Days },
  });

  return {
    summary: {
      totalGlucoseEntries: glucose.length,
      totalDietEntries: diet.length,
      totalExerciseEntries: exercise.length,
    },
    data: {
      glucose,
      diet,
      exercise,
    },
  };
};