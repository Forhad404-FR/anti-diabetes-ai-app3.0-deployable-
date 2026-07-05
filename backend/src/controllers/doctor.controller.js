const doctorService = require("../services/doctor.service");

exports.addDoctor = async (req, res) => {
  try {
    const data = await doctorService.addDoctor(req.body);

    res.status(201).json({
      success: true,
      message: "Doctor added successfully",
      data,
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

exports.getAllDoctors = async (req, res) => {
  try {
    const data = await doctorService.getAllDoctors();

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