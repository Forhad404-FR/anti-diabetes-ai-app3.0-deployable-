const glucoseAnalysis = require("./glucoseAnalysis.service");

class AIEngineService {
  generateAIReport({
    glucoseData = [],
    dietData = [],
    exerciseData = []
  }) {

    const glucose = glucoseAnalysis.analyze(glucoseData);

    let healthScore = 0;

    // =========================
    // GLUCOSE SCORE (60 Marks)
    // =========================

    let glucoseScore = 0;

    if (glucose.avgLevel >= 70 && glucose.avgLevel <= 140) {
      glucoseScore = 60;
    } else if (glucose.avgLevel <= 180) {
      glucoseScore = 45;
    } else {
      glucoseScore = 25;
    }

    if (glucose.spikes >= 3) {
      glucoseScore -= 10;
    }

    if (glucose.lowEvents >= 3) {
      glucoseScore -= 10;
    }

    glucoseScore = Math.max(0, glucoseScore);

    // =========================
    // DIET SCORE (20 Marks)
    // =========================

    let dietScore = 0;

    const totalCaloriesIn = dietData.reduce(
      (sum, item) => sum + (item.calories || 0),
      0
    );

    const avgCaloriesPerDay =
      dietData.length > 0
        ? totalCaloriesIn / dietData.length
        : 0;

    if (avgCaloriesPerDay >= 1200 && avgCaloriesPerDay <= 2500) {
      dietScore = 20;
    } else if (avgCaloriesPerDay <= 3000) {
      dietScore = 10;
    } else {
      dietScore = 0;
    }

    // =========================
    // EXERCISE SCORE (20 Marks)
    // =========================

    let exerciseScore = 0;

    const totalCaloriesBurned = exerciseData.reduce(
      (sum, item) => sum + (item.caloriesBurned || 0),
      0
    );

    if (totalCaloriesBurned >= 1500) {
      exerciseScore = 20;
    } else if (totalCaloriesBurned >= 700) {
      exerciseScore = 10;
    } else {
      exerciseScore = 0;
    }

    // =========================
    // FINAL HEALTH SCORE
    // =========================

    healthScore =
      glucoseScore +
      dietScore +
      exerciseScore;

    healthScore = Math.max(
      0,
      Math.min(100, Math.round(healthScore))
    );

    // =========================
    // RISK LEVEL
    // =========================

    let riskLevel = "high";

    if (healthScore >= 80) {
      riskLevel = "low";
    } else if (healthScore >= 50) {
      riskLevel = "medium";
    }

    // =========================
    // ANALYSIS
    // =========================

    let analysis = glucose.interpretation;

    if (riskLevel === "low") {
      analysis +=
        " Overall health indicators are good and diabetes appears well managed.";
    } else if (riskLevel === "medium") {
      analysis +=
        " Moderate diabetes risk detected. Lifestyle improvements are recommended.";
    } else {
      analysis +=
        " High diabetes-related risk detected. Immediate lifestyle changes are recommended.";
    }

    // =========================
    // RECOMMENDATIONS
    // =========================

    const recommendations = [];

    if (glucose.avgLevel > 140) {
      recommendations.push(
        "Monitor blood glucose more frequently."
      );
    }

    if (glucose.spikes >= 3) {
      recommendations.push(
        "Reduce high carbohydrate meals and review meal timing."
      );
    }

    if (glucose.lowEvents >= 3) {
      recommendations.push(
        "Avoid skipping meals and maintain regular eating habits."
      );
    }

    if (avgCaloriesPerDay > 2500) {
      recommendations.push(
        "Reduce daily calorie intake."
      );
    }

    if (totalCaloriesBurned < 700) {
      recommendations.push(
        "Increase physical activity and weekly exercise."
      );
    }

    if (recommendations.length === 0) {
      recommendations.push(
        "Maintain current healthy lifestyle."
      );
    }

    return {
      riskLevel,
      score: healthScore,
      analysis,
      recommendations,

      healthBreakdown: {
        glucoseScore,
        dietScore,
        exerciseScore,
        totalCaloriesIn,
        totalCaloriesBurned
      },

      glucoseInsight: glucose
    };
  }
}

module.exports = new AIEngineService();