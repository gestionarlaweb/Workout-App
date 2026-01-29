import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/exercise.dart';
import '../../providers/workout_provider.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final int day;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: Column(
        children: [
          // Imagen con manejo de errores incorporado
          Image.asset(
            exercise.imagePath,
            height: 250,
            width: double.infinity,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              height: 250,
              child: Icon(Icons.fitness_center, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${exercise.sets} series x objetivo ${exercise.reps} reps',
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 15),
                _buildInputFields(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Row(
      children: [
        // Campo de Repeticiones
        Expanded(
          child: TextFormField(
            key: Key("${exercise.id}_reps_field"),
            initialValue: exercise.reps,
            decoration: const InputDecoration(
              labelText: 'Reps reales',
              border: OutlineInputBorder(),
            ),
            onChanged: (val) {
              // Guardado inmediato al cambiar
              context.read<WorkoutProvider>().updateExercise(
                    day,
                    exercise.id,
                    reps: val,
                  );
            },
          ),
        ),
        const SizedBox(width: 10),
        // Campo de Peso
        Expanded(
          child: TextFormField(
            key: Key("${exercise.id}_weight_field"),
            initialValue: exercise.weight,
            decoration: const InputDecoration(
              labelText: 'Peso (kg)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (val) {
              // Guardado inmediato al cambiar
              context.read<WorkoutProvider>().updateExercise(
                    day,
                    exercise.id,
                    weight: val,
                  );
            },
          ),
        ),
      ],
    );
  }
}
