import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/model/exercise_model.dart';
import 'package:get/get.dart';

class ExerciseController extends GetxController{
  var absList = <Exercise>[].obs;
  var armsList = <Exercise>[].obs;
  var chestList = <Exercise>[].obs;
  var mbList = <Exercise>[].obs;
  var legsList = <Exercise>[].obs;
  var sbList = <Exercise>[].obs;


  var exerciseLevel = ''.obs;
  var levelName = ''.obs;

  var absCalories = ''.obs;
  var armsCalories = ''.obs;
  var chestCalories = ''.obs;
  var legsCalories = ''.obs;
  var mbCalories = ''.obs;
  var sbCalories = ''.obs;

  var absDuration = ''.obs;
  var armsDuration = ''.obs;
  var legsDuration = ''.obs;
  var chestDuration = ''.obs;
  var mbDuration = ''.obs;
  var sbDuration = ''.obs;

  RxString bmiStatus = "".obs;

  var isLoading = false.obs;
  RxString activityLevelName = "".obs;

  RxInt maintenanceCals = 0.obs;
  RxDouble bmi = 0.0.obs;
  RxDouble activityLevel = 0.0.obs;
  int age = 0;
  String gender = "";

  @override
  void onInit() {
    calculateMacros();
    super.onInit();
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
  Future<void> updateActivityLevel() async {
    if (activityLevel.value == 1.25) {
      activityLevelName.value = "Sedentary";
    } else if (activityLevel.value >= 18.5 && bmi.value < 24.9) {
      activityLevelName.value = "Light";
    } else if (activityLevel.value >= 25 && bmi.value < 29.9) {
      activityLevelName.value = "Moderate";
    } else  {
      activityLevelName.value = "High";
    }
  }
  Future<void> calculateMacros() async {
    isLoading.value = true;
    final snapshot = await _database
        .child(_auth.currentUser!.uid)
        .child('User-Details')
        .get();
    Map<dynamic, dynamic>? map = snapshot.value as Map?;
    double weight = convertToKg(map!["selectedWeight"].toString());
    activityLevel.value =
    double.parse(map["selectedActivityLevel"].toString());
    double height =
    double.parse(map["selectedHeight"].toString().replaceAll(' cm', ''));
    updateActivityLevel();
    bmi.value = await calculateBmi(height, weight);
    updateSuggestion();
    exerciseLevel.value = await suggestExercisePlan();
    fetchAllPlans();
  }

  Future<String> suggestExercisePlan() async {
    if (maintenanceCals.value < 1500) {
      levelName.value = "Beginner";
      return "beginner";
    } else if (maintenanceCals.value <= 2000) {
      if (bmi.value < 18.5) {
        levelName.value = activityLevel.value > 1.55 ?"Intermediate" : "Beginner";
        return activityLevel.value > 1.55 ? "intermediate" : "beginner";
      } else if (bmi.value < 25) {
        levelName.value = activityLevel.value > 1.55 ? "Advanced" : "Intermediate";
        return activityLevel.value > 1.55 ? "advanced" : "intermediate";
      } else if (bmi.value < 30) {
        levelName.value = activityLevel.value > 1.55 ? "Intermediate" : "Beginner";
        return activityLevel.value > 1.55 ? "intermediate" : "beginner";
      } else {
        levelName.value = "Beginner";
        return "beginner";
      }
    } else {
      if (bmi.value < 18.5) {
        levelName.value = "Intermediate";
        return "intermediate";
      } else if (bmi.value < 25) {
        levelName.value = "Advanced";
        return "advanced";
      } else if (bmi.value < 30) {
        levelName.value = activityLevel.value > 1.55 ? "Advanced" : "Intermediate";
        return activityLevel.value > 1.55 ? "advanced" : "intermediate";
      } else {
        levelName.value = activityLevel.value > 1.55 ? "Intermediate" : "Beginner";
        return activityLevel.value > 1.55 ? "intermediate" : "beginner";
      }
    }
  }
  Future<void> fetchAbsPlan() async {
    absList.clear();
    final absSnapshot = await _database.child("Excercises").child("abs_exercises").child(exerciseLevel.value).once();
    Map<dynamic, dynamic>? data = absSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      absList.assignAll(exercisePlan.exercises);
      absCalories.value = exercisePlan.calories;
      absDuration.value = exercisePlan.duration;
    }
  }
  Future<void> fetchArmsPlan() async {
    armsList.clear();
    final absSnapshot = await _database.child("Excercises").child("arm_exercises").child(exerciseLevel.value).once();
    Map<dynamic, dynamic>? data = absSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      armsList.assignAll(exercisePlan.exercises);
      armsCalories.value = exercisePlan.calories;
      armsDuration.value = exercisePlan.duration;
    }
  }
  Future<void> fetchChestPlan() async {
    chestList.clear();
    final absSnapshot = await _database.child("Excercises").child("chest_exercises").child(exerciseLevel.value).once();
    Map<dynamic, dynamic>? data = absSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      chestList.assignAll(exercisePlan.exercises);
      chestCalories.value = exercisePlan.calories;
      chestDuration.value = exercisePlan.duration;
    }
  }
  Future<void> fetchMBPlan() async {
    mbList.clear();
    final absSnapshot = await _database.child("Excercises").child("fatloss_muscle_building_exercises").child(exerciseLevel.value).once();
    Map<dynamic, dynamic>? data = absSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      mbList.assignAll(exercisePlan.exercises);
      mbCalories.value = exercisePlan.calories;
      mbDuration.value = exercisePlan.duration;
    }
  }
  Future<void> fetchLegsPlan() async {
    legsList.clear();
    final absSnapshot = await _database.child("Excercises").child("leg_exercises").child(exerciseLevel.value).once();
    Map<dynamic, dynamic>? data = absSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      legsList.assignAll(exercisePlan.exercises);
      legsCalories.value = exercisePlan.calories;
      legsDuration.value = exercisePlan.duration;
    }
  }
  Future<void> fetchSBPlan() async {
    sbList.clear();
    final absSnapshot = await _database.child("Excercises").child("shoulder_and_Back").child(exerciseLevel.value).once();
    Map<dynamic, dynamic>? data = absSnapshot.snapshot.value as Map?;
    if (data != null) {
      ExercisePlan exercisePlan = ExercisePlan.fromJson(data);
      sbList.assignAll(exercisePlan.exercises);
      sbCalories.value = exercisePlan.calories;
      sbDuration.value = exercisePlan.duration;
    }
  }
  void fetchAllPlans() async {
    await fetchAbsPlan();
    await fetchArmsPlan();
    isLoading.value = false;
    await fetchChestPlan();
    await fetchLegsPlan();
    await fetchMBPlan();
    await fetchSBPlan();

  }
  }
