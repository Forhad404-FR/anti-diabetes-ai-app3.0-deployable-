// services/ai/riskScoring.service.js

class RiskScoringService {

  calculate({ glucoseAnalysis, dietData = [], exerciseData = [] }) {

    let score = 0;

    // =========================
    // 1. GLUCOSE IMPACT (MOST IMPORTANT)
    // =========================
    if (glucoseAnalysis.trend === "dangerous") {
      score += 50;
    } 
    else if (glucoseAnalysis.trend === "unstable") {
      score += 30;
    } 
    else {
      score += 10;
    }

    // Extra glucose penalty
    if (glucoseAnalysis.avgLevel > 180) score += 10;
    if (glucoseAnalysis.spikes >= 3) score += 10;

    // =========================
    // 2. EXERCISE IMPACT
    // =========================
    const exerciseCount = exerciseData.length;

    if (exerciseCount === 0) {
      score += 25;
    } 
    else if (exerciseCount < 3) {
      score += 10;
    } 
    else {
      score -= 10;
    }

    // =========================
    // 3. DIET IMPACT
    // =========================
    const dietCount = dietData.length;

    if (dietCount === 0) {
      score += 20;
    } 
    else if (dietCount < 3) {
      score += 10;
    } 
    else {
      score -= 10;
    }

    // =========================
    // 4. FINAL LIMIT CONTROL
    // =========================
    if (score < 0) score = 0;
    if (score > 100) score = 100;

    // =========================
    // 5. RISK LEVEL CLASSIFICATION
    // =========================
    let riskLevel = "low";

    if (score >= 70) {
      riskLevel = "high";
    } 
    else if (score >= 40) {
      riskLevel = "medium";
    }

    return {
      score,
      riskLevel
    };
  }
}

module.exports = new RiskScoringService();