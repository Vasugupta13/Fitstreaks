import 'package:firebase_core/firebase_core.dart';
import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/lower_body_stretch_view.dart';
import 'package:fitstreaks/res/test_file_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitstreaks/features/stretching/view/full_body_stretching_view.dart';
import 'package:get/get.dart';

void main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  Get.put(StretchController());
  testWidgets('FullBodyStretchingView has a title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(home: FullBodyStretchingView()));

    // Verify that our widget has a title.
    expect(find.text('Full body Stretching'), findsOneWidget);
  });
  testWidgets('LowerBodyStretchView has a title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(home: LowerBodyStretchView()));

    // Verify that our widget has a title.
    expect(find.text('Lower body Stretching'), findsOneWidget);
  });
}