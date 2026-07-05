const Doctor = require("../models/Doctor");

exports.addDoctor = async (data) => {
  return await Doctor.create(data);
};

exports.getAllDoctors = async () => {
  return await Doctor.find().sort({ createdAt: -1 });
};