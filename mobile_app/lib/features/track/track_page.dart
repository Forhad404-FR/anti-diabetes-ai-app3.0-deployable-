import 'package:flutter/material.dart';

import 'glucose/glucose_home.dart';
import 'diet/diet_home.dart';
import 'exercise/exercise_home.dart';

class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Track"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Glucose"),
              Tab(text: "Diet"),
              Tab(text: "Exercise"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GlucoseHome(),
            DietHome(),
            ExerciseHome(),
          ],
        ),
      ),
    );
  }
}