import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_gender_select_view.dart';
import 'package:fitstreaks/features/form/views/normal/normal_gender_select_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormController extends GetxController {
  late DateTime now;
  late DateTime previousDay;
  @override
  void onInit() {
    now = DateTime.now();
    previousDay = now.subtract(const Duration(days: 1));
    previousDayName.value = DateFormat('EEEE').format(previousDay).toLowerCase();
    currentDayName.value = DateFormat('EEEE').format(now).toLowerCase();
    super.onInit();
  }
  RxString selectedChoice = ''.obs;
  RxString selectedGender = ''.obs;
  RxString selectedMotivation = ''.obs;
  RxString selectedDisabilityType = ''.obs;
  RxString selectedPreviousExp = ''.obs;
  RxInt selectedWorkoutDays = 2.obs;
  RxString selectedPushUpLevel = ''.obs;
  RxString selectedActivityLevel = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxString currentDayName = "".obs;
  RxString previousDayName = "".obs;

  void selectChoice(String choice) {
    selectedChoice.value = choice;
  }

  void selectGender(String choice) {
    selectedGender.value = choice;
  }

  void selectMotivation(String choice) {
    selectedMotivation.value = choice;
  }

  void selectDisabilityType(String choice) {
    selectedDisabilityType.value = choice;
  }

  void selectPreviousExp(String choice) {
    selectedPreviousExp.value = choice;
  }

  void selectWorkoutDays(int day) {
    selectedWorkoutDays.value = day;
  }

  void selectPushUpLevel(String choice) {
    selectedPushUpLevel.value = choice;
  }

  void selectActivityLevel(String choice) {
    selectedActivityLevel.value = choice;
  }
  void setDisabledOrNot(bool isDisabled) async {
    if (isDisabled) {
      await _dbRef.child(_auth.currentUser!.uid).child('User-Details').update({
        'isDisabled': true,
      });
      _dbRef.child(_auth.currentUser!.uid).child('Form-Progress').set({
        'isDisabled': true,
        'selectedGender': false,
        'selectedMotivation': false,
        'selectedTypeOfDisability': false,
        'selectedPreviousWorkout': false,
        'selectedWorkoutDays': false,
        'selectedHeightWeight': false,
      }).then((value) => Get.to(() => const DisabledGenderSelection()));
      return;
    }
    await _dbRef.child(_auth.currentUser!.uid).child('User-Details').update({
      'isDisabled': false,
    });
    _dbRef.child(_auth.currentUser!.uid).child('Form-Progress').set({
      'isDisabled': false,
      'selectedGender': false,
      'selectedMotivation': false,
      'selectedPushUpLevel': false,
      'selectedActivityLevel': false,
      'selectedWorkoutDays': false,
      'selectedHeightWeight': false,
    }).then((value) => Get.to(() => const NormalGenderSelectView()));
  }
  Future<void> changeFormProgress({
    String? title,
    bool? value,
  }) async {
    await _dbRef.child(_auth.currentUser!.uid).child('Form-Progress').update({
      title! : value ?? false,
    });
  }
  Future<void> setDisabledDetails() async {
    await _dbRef.child(_auth.currentUser!.uid).child('User-Details').set({
      'selectedGender':'',
      'selectedMotivation':'',
      'selectedTypeOfDisability':'',
      'selectedPreviousExp':'',
      'selectedActivityLevel': '1.25',
      'selectedDays':'',
      'selectedWeight':'',
      'selectedHeight':'',
      'selectedAge':'',
    });
  }
  Future<void> setNormalDetails() async {
    await _dbRef.child(_auth.currentUser!.uid).child('User-Details').update({
      'selectedGender': '',
      'selectedMotivation': '',
      'selectedPushUpLevel': '',
      'selectedActivityLevel': '',
      'selectedDays': '',
      'selectedHeightWeight': '',
    });
  }
  Future<void> setFormCompleteStatus() async {
    await _dbRef.child(_auth.currentUser!.uid).child('User-Details').update({
      'formCompleted': true,
    });
  }
  Future<void> changeUserDetails({
    String? title,
    String? value,
  }) async {
    await _dbRef.child(_auth.currentUser!.uid).child('User-Details').update({
      title! : value ?? '',
    });
  }
  Future<void> setUserStepDetails() async {
    _firestore.collection('Step-details').doc(_auth.currentUser!.uid).set({
      'totalStepCount': 0,
      'monday': 0,
      'tuesday': 0,
      'wednesday': 0,
      'thursday': 0,
      'friday': 0,
      'saturday': 0,
      'sunday': 0,
    });
  }
}
