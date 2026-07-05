const glucoseService = require("../services/glucose.service");

exports.addGlucose = async (req, res) => {
  try {
    const data = await glucoseService.addGlucose(req.user.userId, req.body);

    res.status(201).json({
      success: true,
      message: "Glucose added successfully",
      data,
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

exports.getMyGlucose = async (req, res) => {
  try {
    const data = await glucoseService.getMyGlucose(req.user.userId);

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