import 'package:flutter/material.dart';

import '../../../core/services/dashboard_service.dart';
import 'widgets/health_score_card.dart';
import 'widgets/summary_card.dart';
import 'widgets/ai_tip_card.dart';
import 'widgets/alert_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic> report = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadReport();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadReport();
  }

  Future<void> loadReport() async {
    final res = await DashboardService.getWeeklyReport();

    final Map<String, dynamic> root =
        res is Map<String, dynamic> ? res : {};

    final Map<String, dynamic> data =
        root['data'] ?? {};

    setState(() {
      report = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final weekly = report['weeklyReport'] ?? {};
    final ai = report['aiAnalysis'] ?? {};

    final data = weekly['data'] ?? {};

    final glucoseList = data['glucose'] ?? [];
    final diet = data['diet'] ?? [];
    final exercise = data['exercise'] ?? [];

    final glucoseInsight = ai['glucoseInsight'] ?? {};

    double latestGlucose = 0;

    if (glucoseList.isNotEmpty) {
      latestGlucose =
          (glucoseList.last['glucoseLevel'] ?? 0).toDouble();
    }

    List<String> alerts = [];

    final score = ai['score'] ?? 0;

    if ((glucoseInsight['avgLevel'] ?? 0) > 180) {
      alerts.add("High glucose level detected.");
    }

    if ((glucoseInsight['lowEvents'] ?? 0) >= 2) {
      alerts.add("Low glucose events detected.");
    }

    if (exercise.length == 0) {
      alerts.add("No exercise record found this week.");
    }

    if (score < 50) {
      alerts.add("Health score is low. Immediate attention recommended.");
    }

    if (ai['riskLevel'] == "high") {
      alerts.add("High diabetes risk detected.");
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: RefreshIndicator(
        onRefresh: loadReport,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SummaryCard(
                avgGlucose:
                    glucoseList.isEmpty ? null : latestGlucose,
                riskLevel: ai['riskLevel'] ?? "unknown",
              ),

              const SizedBox(height: 20),

              HealthScoreCard(
                  score: score.toDouble(),
                  breakdown: ai['healthBreakdown'],
                  riskLevel: ai['riskLevel'] ?? 'unknown',
                ),

              const SizedBox(height: 20),

              if (alerts.isNotEmpty) ...[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Health Alerts",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                ...alerts.map(
                  (alert) => AlertCard(message: alert),
                ),

                const SizedBox(height: 20),
              ],

              AITipCard(
                analysis: ai['analysis'] ??
                    "No AI analysis available yet",
                recommendations: List<String>.from(
                  ai['recommendations'] ?? [],
                ),
              ),

              const SizedBox(height: 20),

              Card(
  child: ListTile(
    title: const Text("Diet Entries"),
    subtitle: Text("${diet.length} meals logged"),
    trailing: const Icon(Icons.restaurant),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Exercise Entries"),
    subtitle: Text("${exercise.length} workouts logged"),
    trailing: const Icon(Icons.fitness_center),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Average Glucose"),
    subtitle: Text(
      "${glucoseInsight['avgLevel'] ?? '--'} mg/dL",
    ),
    trailing: const Icon(Icons.monitor_heart),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Diet Entries"),
    subtitle: Text("${diet.length} meals logged"),
    trailing: const Icon(Icons.restaurant),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Exercise Entries"),
    subtitle: Text("${exercise.length} workouts logged"),
    trailing: const Icon(Icons.fitness_center),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Average Glucose"),
    subtitle: Text(
      "${glucoseInsight['avgLevel'] ?? '--'} mg/dL",
    ),
    trailing: const Icon(Icons.monitor_heart),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Glucose Trend"),
    subtitle: Text(
      "${glucoseInsight['trend'] ?? 'unknown'}",
    ),
    trailing: const Icon(Icons.show_chart),
  ),
),

const SizedBox(height: 10),

Card(
  child: ListTile(
    title: const Text("Glucose Spikes"),
    subtitle: Text(
      "${glucoseInsight['spikes'] ?? 0}",
    ),
    trailing: const Icon(Icons.trending_up),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}