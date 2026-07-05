const Glucose = require("../models/Glucose");

exports.addGlucose = async (userId, data) => {
  const { glucoseLevel, measurementType, notes } = data;

  if (!glucoseLevel) {
    throw new Error("Glucose level is required");
  }

  if (!measurementType) {
    throw new Error("Measurement type is required");
  }

  const record = await Glucose.create({
    user: userId,
    glucoseLevel,
    measurementType,
    notes,
  });

  return record;
};

exports.getMyGlucose = async (userId) => {
  return await Glucose.find({ user: userId }).sort({ date: -1 });
};