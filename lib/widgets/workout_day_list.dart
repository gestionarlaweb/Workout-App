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

    // ... dentro del build de WorkoutDayList ...
    return ListView.builder(
      itemCount: exercises.length,
      // ESTO SOLUCIONA TU PROBLEMA: añade 100px de espacio al final
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 100),
      itemBuilder: (context, index) {
        return ExerciseCard(
          exercise: exercises[index],
          day: day,
        );
      },
    );
  }
}
