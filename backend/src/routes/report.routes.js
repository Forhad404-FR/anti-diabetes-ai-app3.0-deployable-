const express = require("express");
const router = express.Router();

const reportController = require("../controllers/report.controller");
const authMiddleware = require("../middleware/auth.middleware");

router.get("/weekly", authMiddleware, reportController.getWeeklyReport);

module.exports = router;