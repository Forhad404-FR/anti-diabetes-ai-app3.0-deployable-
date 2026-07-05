const Diet = require("../models/Diet");

exports.addDiet = async (userId, data) => {
  return await Diet.create({
    user: userId,
    ...data,
  });
};

exports.getMyDiet = async (userId) => {
  return await Diet.find({ user: userId }).sort({ createdAt: -1 });
};