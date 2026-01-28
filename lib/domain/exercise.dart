class Exercise {
  final String id;
  final String name;
  final String imagePath;
  final String sets;
  String reps;
  String weight;

  Exercise({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.sets,
    required this.reps,
    this.weight = "0",
  });

  // Crea un objeto Exercise desde un Map (JSON)
  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      sets: map['sets'] ?? '',
      reps: map['reps'] ?? '',
      weight: map['weight'] ?? "0",
    );
  }

  // Convierte a Map para guardar en Shared Preferences
  Map<String, dynamic> toMap() => {
        'id': id,
        'reps': reps,
        'weight': weight,
      };
}
