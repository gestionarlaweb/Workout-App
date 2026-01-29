import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/exercise.dart';

class WorkoutProvider with ChangeNotifier {
  Map<int, List<Exercise>> _days = {};
  bool _isLoading = true;
  bool _isSaving = false;

  Map<int, List<Exercise>> get days => _days;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;

  WorkoutProvider() {
    init();
  }

  Future<void> init() async {
    try {
      await _loadFromAssets();
      await _loadPersistedData();
    } catch (e) {
      debugPrint("❌ Error en la inicialización: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadFromAssets() async {
    final String response = await rootBundle.loadString('assets/workouts.json');
    final data = json.decode(response) as Map<String, dynamic>;
    _days = data.map((key, value) {
      return MapEntry(
        int.parse(key),
        (value as List).map((e) => Exercise.fromMap(e)).toList(),
      );
    });
  }

  Future<void> _loadPersistedData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? stored = prefs.getString('workout_persistence');
    if (stored != null) {
      final List decoded = json.decode(stored);
      for (var item in decoded) {
        for (var list in _days.values) {
          for (var ex in list) {
            if (ex.id == item['id']) {
              ex.weight = item['weight'] ?? "0";
              ex.reps = item['reps'] ?? ex.reps;
            }
          }
        }
      }
    }
  }

  void updateExercise(int day, String id, {String? weight, String? reps}) {
    if (_days[day] == null) return;
    try {
      final ex = _days[day]!.firstWhere((e) => e.id == id);
      if (weight != null) ex.weight = weight;
      if (reps != null) ex.reps = reps;
      _saveToDisk();
    } catch (e) {
      debugPrint("❌ Error al actualizar memoria: $e");
    }
  }

  Future<void> _saveToDisk() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final allExercises =
          _days.values.expand((list) => list).map((e) => e.toMap()).toList();
      await prefs.setString('workout_persistence', json.encode(allExercises));

      _isSaving = true;
      notifyListeners();

      Future.delayed(const Duration(milliseconds: 1000), () {
        _isSaving = false;
        notifyListeners();
      });
    } catch (e) {
      debugPrint("❌ Error crítico al guardar: $e");
    }
  }
}
