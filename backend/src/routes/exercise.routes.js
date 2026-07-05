const express = require("express");
const router = express.Router();

const exerciseController = require("../controllers/exercise.controller");
const authMiddleware = require("../middleware/auth.middleware");

router.post("/add", authMiddleware, exerciseController.addExercise);
router.get("/my", authMiddleware, exerciseController.getMyExercise);

module.exports = router;