const Exercise = require("../models/Exercise");

function calculateCalories(type, duration, intensity) {
  const exerciseType = (type || "").toLowerCase();
  const exerciseIntensity = (intensity || "medium").toLowerCase();

  let caloriesPerMinute = 5;

  if (exerciseType.includes("walk")) {
    caloriesPerMinute = 5;
  } else if (exerciseType.includes("run")) {
    caloriesPerMinute = 10;
  } else if (exerciseType.includes("cycling")) {
    caloriesPerMinute = 8;
  } else if (exerciseType.includes("gym")) {
    caloriesPerMinute = 7;
  } else if (exerciseType.includes("workout")) {
    caloriesPerMinute = 7;
  }

  if (exerciseIntensity === "low") {
    caloriesPerMinute *= 0.8;
  } else if (exerciseIntensity === "high") {
    caloriesPerMinute *= 1.2;
  }

  return Math.round(duration * caloriesPerMinute);
}

exports.addExercise = async (userId, data) => {
  const caloriesBurned = calculateCalories(
    data.type,
    data.duration,
    data.intensity
  );

  return await Exercise.create({
    user: userId,
    ...data,
    caloriesBurned,
  });
};

exports.getMyExercise = async (userId) => {
  return await Exercise.find({ user: userId }).sort({ createdAt: -1 });
};