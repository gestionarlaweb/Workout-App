import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/workout_provider.dart';
import 'exercise_card.dart';

class WorkoutDayList extends StatelessWidget {
  final int day;

  const WorkoutDayList({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final workoutProvider = context.watch<WorkoutProvider>();

    if (workoutProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final exercises = workoutProvider.days[day];

    if (exercises == null || exercises.isEmpty) {
      return const Center(child: Text("No hay ejercicios para este día"));
    }

    return ListView.builder(
      itemCount: exercises.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return ExerciseCard(
          exercise: exercises[index],
          day: day,
        );
      },
    );
  }
}
