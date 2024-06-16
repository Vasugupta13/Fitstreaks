import 'package:fitstreaks/features/exercises/controller/exercise_controller.dart';
import 'package:fitstreaks/res/test_file_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  // Initialize Firebase
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  ExerciseController exerciseController = Get.put(ExerciseController());

  test('updateSuggestion updates bmiStatus correctly', () async {
    exerciseController.bmi.value = 25;

    await exerciseController.updateSuggestion();

    expect(exerciseController.bmiStatus.value, 'Overweight');
  });

  test('updateActivityLevel updates activityLevelName correctly', () async {
    exerciseController.activityLevel.value = 1.25;

    await exerciseController.updateActivityLevel();

    expect(exerciseController.activityLevelName.value, 'Sedentary');
  });
}