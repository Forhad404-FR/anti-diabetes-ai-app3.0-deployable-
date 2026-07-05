// services/ai/glucoseAnalysis.service.js

class GlucoseAnalysisService {
  
  analyze(glucoseData = []) {
    if (!glucoseData.length) {
      return {
        trend: "no-data",
        avgLevel: 0,
        spikes: 0,
        message: "No glucose data available"
      };
    }

    // 1. Extract values
   const values = glucoseData.map(item => item.glucoseLevel);
   
    // 2. Calculate average glucose
    const sum = values.reduce((acc, val) => acc + val, 0);
    const avg = sum / values.length;

    // 3. Detect spikes (>180 is considered high spike)
    const spikes = values.filter(val => val >= 180).length;

    // 4. Detect low glucose events (<70)
    const lows = values.filter(val => val < 70).length;

    // 5. Determine trend logic
    let trend = "stable";

    if (spikes >= 3) {
      trend = "dangerous";
    } 
    else if (spikes >= 1 || lows >= 2) {
      trend = "unstable";
    }

    // 6. Extra intelligence: variance check
    const variance =
      values.reduce((acc, val) => acc + Math.pow(val - avg, 2), 0) /
      values.length;

    if (variance > 2500) {
      trend = "unstable";
    }

    // 7. Return structured AI output
    return {
      trend,
      avgLevel: Math.round(avg),
      spikes,
      lowEvents: lows,
      variance: Math.round(variance),
      interpretation: this.getInterpretation(trend, avg, spikes)
    };
  }

  // Simple explanation generator
  getInterpretation(trend, avg, spikes) {
    if (trend === "dangerous") {
      return "Glucose levels are frequently very high, indicating poor control.";
    }

    if (trend === "unstable") {
      return "Glucose levels are fluctuating significantly with irregular spikes.";
    }

    if (avg > 140) {
      return "Average glucose is slightly elevated but currently stable.";
    }

    return "Glucose levels are stable and within a healthy range.";
  }
}

module.exports = new GlucoseAnalysisService();