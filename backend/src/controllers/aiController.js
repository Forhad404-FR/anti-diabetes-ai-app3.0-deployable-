const aiEngine = require("../services/ai/aiEngine.service");

exports.askAI = async (req, res) => {
  try {
    const { message } = req.body;

    let reply =
      "I recommend maintaining a balanced diet, monitoring glucose regularly, and staying physically active.";

    const text = (message || "").toLowerCase();

    if (text.includes("glucose")) {
      reply =
        "High glucose levels may be caused by excess carbohydrates, stress, illness, or insufficient physical activity.";
    } else if (text.includes("diet")) {
      reply =
        "Focus on vegetables, lean protein, whole grains, and avoid excessive sugary foods.";
    } else if (text.includes("exercise")) {
      reply =
        "Aim for at least 30 minutes of walking or moderate exercise most days of the week.";
    } else if (text.includes("risk")) {
      reply =
        "Maintaining healthy glucose levels, diet control, and regular exercise can reduce diabetes risk.";
    }

    res.status(200).json({
      success: true,
      reply,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};