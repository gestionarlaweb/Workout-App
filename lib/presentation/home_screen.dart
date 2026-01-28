import 'package:flutter/material.dart';
import '../widgets/workout_day_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MI RUTINA',
            style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.orangeAccent,
            indicatorWeight: 4,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'DÍA 1'),
              Tab(text: 'DÍA 2'),
              Tab(text: 'DÍA 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WorkoutDayList(day: 1),
            WorkoutDayList(day: 2),
            WorkoutDayList(day: 3),
          ],
        ),
      ),
    );
  }
}
