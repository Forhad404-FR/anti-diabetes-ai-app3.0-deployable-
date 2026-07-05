const express = require("express");
const router = express.Router();

const dietController = require("../controllers/diet.controller");
const authMiddleware = require("../middleware/auth.middleware");

router.post("/add", authMiddleware, dietController.addDiet);
router.get("/my", authMiddleware, dietController.getMyDiet);

module.exports = router;