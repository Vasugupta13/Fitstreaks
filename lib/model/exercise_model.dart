class Exercise {
  String name;
  String description;
  String repetitions;
  String duration;
  String image;
  String cals;

  Exercise({
    required this.name,
    required this.description,
    required this.repetitions,
    required this.image,
    required this.duration,
    required this.cals,
  });

  factory Exercise.fromJson(dynamic json) {
    return Exercise(
      name: json['name'],
      description: json['description'],
      repetitions: json['repetitions'] ?? "",
      image: json['image'],
      duration: json['duration'] ?? "",
      cals: json['cals'] ?? '',
    );
  }
}

class ExercisePlan {
  List<Exercise> exercises;
  String calories;
  String duration;

  ExercisePlan({
    required this.exercises,
    required this.calories,
    required this.duration,
  });

  factory ExercisePlan.fromJson(dynamic json) {
    List<Exercise> exercises = [];
    json.forEach((key, value) {
      if (value is Map && value.containsKey('name')) {
        exercises.add(Exercise.fromJson(value));
      }
    });
    return ExercisePlan(
      exercises: exercises,
      calories: json['cals'] ?? "50",
      duration: json['duration'],
    );
  }
}
