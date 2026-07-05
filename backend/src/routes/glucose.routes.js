const express = require("express");
const router = express.Router();

const glucoseController = require("../controllers/glucose.controller");
const authMiddleware = require("../middleware/auth.middleware");

router.post("/add", authMiddleware, glucoseController.addGlucose);
router.get("/my", authMiddleware, glucoseController.getMyGlucose);

module.exports = router;