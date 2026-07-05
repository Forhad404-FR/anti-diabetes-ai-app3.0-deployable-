const healthRoutes = require("./routes/health.routes");
const express = require("express");
const cors = require("cors");
const morgan = require("morgan");
const authRoutes = require("./routes/auth.routes");
const app = express();
const protectedRoutes = require("./routes/protected.routes");
const glucoseRoutes = require("./routes/glucose.routes");
const dietRoutes = require("./routes/diet.routes");
const exerciseRoutes = require("./routes/exercise.routes");
const doctorRoutes = require("./routes/doctor.routes");
const reportRoutes = require("./routes/report.routes");
const aiRoutes = require("./routes/aiRoutes");


// Middleware
app.use(cors());
app.use(express.json());
app.use(morgan("dev"));
app.use("/api/health", healthRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/protected", protectedRoutes);
app.use("/api/glucose", glucoseRoutes);
app.use("/api/diet", dietRoutes);
app.use("/api/exercise", exerciseRoutes);
app.use("/api/doctors", doctorRoutes);
app.use("/api/reports", reportRoutes);
app.use("/api/ai", aiRoutes);

// Test Route
app.get("/", (req, res) => {
  res.send("🚀 Anti-Diabetes AI Backend is Running");
});

module.exports = app;