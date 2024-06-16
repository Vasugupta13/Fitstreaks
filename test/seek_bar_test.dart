import 'package:firebase_core/firebase_core.dart';
import 'package:fitstreaks/features/diet_plan/view/widgets/diet_plan_suggestion_widget.dart';
import 'package:fitstreaks/res/test_file_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitstreaks/features/diet_plan/controller/diet_controller.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  testWidgets('CircularSeekBar in DietPlanSuggestionWidget has correct BMI', (WidgetTester tester) async {
    // Initialize the DietController with a mock BMI value
    final controller =  Get.put(DietController());
    controller.bmi.value = 23.00;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: DietPlanSuggestionWidget(),
    ));

    // Verify that our CircularSeekBar displays the correct BMI.
    expect(find.text('23.00'), findsOneWidget);
  });
}