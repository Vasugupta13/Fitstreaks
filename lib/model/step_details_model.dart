class StepDetails {
  final int totalStepCount;
  final int monday;
  final int tuesday;
  final int wednesday;
  final int thursday;
  final int friday;
  final int saturday;
  final int sunday;

  StepDetails({
    required this.totalStepCount,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory StepDetails.fromMap(Map<String, dynamic> data) {
    return StepDetails(
      totalStepCount: data['totalStepCount'],
      monday: data['monday'],
      tuesday: data['tuesday'],
      wednesday: data['wednesday'],
      thursday: data['thursday'],
      friday: data['friday'],
      saturday: data['saturday'],
      sunday: data['sunday'],
    );
  }
}