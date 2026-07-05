const exerciseService = require("../services/exercise.service");

exports.addExercise = async (req, res) => {
  try {
    const data = await exerciseService.addExercise(
      req.user.userId,
      req.body
    );

    res.status(201).json({
      success: true,
      message: "Exercise record added successfully",
      data,
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

exports.getMyExercise = async (req, res) => {
  try {
    const data = await exerciseService.getMyExercise(req.user.userId);

    res.status(200).json({
      success: true,
      data,
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};