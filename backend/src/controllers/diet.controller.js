const dietService = require("../services/diet.service");

exports.addDiet = async (req, res) => {
  try {
    const data = await dietService.addDiet(req.user.userId, req.body);

    res.status(201).json({
      success: true,
      message: "Diet record added successfully",
      data,
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

exports.getMyDiet = async (req, res) => {
  try {
    const data = await dietService.getMyDiet(req.user.userId);

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