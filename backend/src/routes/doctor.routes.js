const express = require("express");
const router = express.Router();

const doctorController = require("../controllers/doctor.controller");
const authMiddleware = require("../middleware/auth.middleware");

router.post("/add", authMiddleware, doctorController.addDoctor);
router.get("/all", authMiddleware, doctorController.getAllDoctors);

module.exports = router;