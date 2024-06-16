import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/model/exercise_model.dart';
import 'package:get/get.dart';

class DisabilityController extends GetxController {
  var exerciseList = <Exercise>[].obs;
  var cals = "".obs;
  var duration = "".obs;
  var isLoading = false.obs;

  RxInt maintenanceCals = 0.obs;
  RxDouble bmi = 0.0.obs;
  RxString bmiStatus = "".obs;
  RxDouble activityLevel = 0.0.obs;
  int age = 0;
  String gender = "";

  void init(String disabilityType) async {
    isLoading.value = true;
    await calculateMacros();
    await fetchExercises(disabilityType);
    isLoading.value = false;
  }
  Future<void> calculateMacros() async {
    final snapshot = await _database
        .child(_auth.currentUser!.uid)
        .child('User-Details')
        .get();
    Map<dynamic, dynamic>? map = snapshot.value as Map?;
    double weight = convertToKg(map!["selectedWeight"].toString());
    activityLevel.value = double.parse(map["selectedActivityLevel"].toString());
    double height =
        double.parse(map["selectedHeight"].toString().replaceAll(' cm', ''));
    bmi.value = await calculateBmi(height, weight);
    updateSuggestion();
  }

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<double> calculateBmi(double height, double weight) async {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  double convertToKg(String weight) {
    double value = 0;
    if (weight.contains('lb')) {
      value = double.parse(weight.replaceAll('lb', ''));
      value = value * 0.453592;
    } else if (weight.contains('kg')) {
      value = double.parse(weight.replaceAll('kg', ''));
    }
    return value;
  }

  Future<void> updateSuggestion() async {
    if (bmi.value < 18.5) {
      bmiStatus.value = "Underweight";
    } else if (bmi.value >= 18.5 && bmi.value < 24.9) {
      bmiStatus.value = "Normal";
    } else if (bmi.value >= 25 && bmi.value < 29.9) {
      bmiStatus.value = "Overweight";
    } else if (bmi.value >= 30) {
      bmiStatus.value = "Obese";
    }
  }

  Future<void> fetchExercises(String disabilityType) async {
    exerciseList.clear();
    final exerciseSnapshot =
    await _database.child(disabilityType).child("Exercises").once();
    Map<dynamic, dynamic>? data = exerciseSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      exerciseList.assignAll(exercisePlan.exercises);
      cals.value = exercisePlan.calories;
      duration.value = exercisePlan.duration;

    }
  }
}
