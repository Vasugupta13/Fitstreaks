import 'package:firebase_core/firebase_core.dart';
import 'package:fitstreaks/controller/pedometer_controller.dart';
import 'package:fitstreaks/res/test_file_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  PedometerController pedometerController = Get.put(PedometerController());


  test('setStepGoal sets the step goal correctly', () async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    int goal = 5000;

    when(prefs.setInt("stepGoal", goal)).thenAnswer((_) async => true);

    await pedometerController.setStepGoal(goal);

    verify(prefs.setInt("stepGoal", goal)).called(1);
  });
}