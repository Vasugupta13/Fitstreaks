import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedometerController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late DateTime now;
  RxString currentDayName = "".obs;
  RxString prevDayName = "".obs;
  final RxInt _steps = 0.obs;
  int get steps => _steps.value;
  late Stream<StepCount> _stepCountStream;
  int _lastStepCount = 0;
  final RxInt _goal = 0.obs;
  int get goal => _goal.value;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    await initDateTime();
    await initPlatformState();
    await checkNullValues();
    await onDayChangedCount();
    showStepGoal();
  }

  Future<void> initDateTime() async {
    now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    currentDayName.value = DateFormat('EEEE').format(now).toLowerCase();
    prevDayName.value = DateFormat('EEEE').format(yesterday).toLowerCase();
  }

  void onStepCount(StepCount event) async {
    final SharedPreferences prefs = await _prefs;
    if (event.steps < _lastStepCount) {
      _lastStepCount = 0;
    }
    int incrementalSteps = event.steps - _lastStepCount;
    _steps.value += incrementalSteps;
    _lastStepCount = event.steps;
    await prefs.setInt('totalStepCount', _steps.value);
    print(_steps.value);
  }

  void showStepGoal() async {
    final SharedPreferences prefs = await _prefs;
    _goal.value = prefs.getInt("stepGoal") ?? 2000;
  }

  Future<void> setStepGoal(int goal) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("stepGoal", goal);
    showStepGoal();
  }

  Future<void> setStepsForNewUser() async {
    final SharedPreferences prefs = await _prefs;
    final snapshot = await _dbRef
        .child(_auth.currentUser!.uid)
        .child('User-Details')
        .child('selectedTypeOfDisability')
        .get();
    if (snapshot.exists) {
      bool isLocoMotor =
          snapshot.value.toString() == "Locomotor Disability" ? true : false;
      if (!isLocoMotor) {
        await prefs.setInt('totalStepCount', 0);
        await prefs.setInt('previousStepCount', 0);
        await prefs.setInt('stepGoal', 2000);
        await prefs.setString('currentDay', currentDayName.value);
      }
    }
  }

  checkNullValues() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString("currentDay") == null ||
        prefs.getInt("totalStepCount") == null ||
        prefs.getInt("previousStepCount") == null) {
      prefs.setInt("totalStepCount", _steps.value);
      prefs.setString("currentDay", currentDayName.value);
      prefs.setInt("previousStepCount", 0);
    }
  }

  Future<void> onDayChangedCount() async {
    print('Day changed');
    final SharedPreferences prefs = await _prefs;
    String currentDay = prefs.getString("currentDay")!;
    int totalSteps = prefs.getInt("totalStepCount")!;
    int prevSteps = prefs.getInt("previousStepCount")!;
    if (currentDay != currentDayName.value) {
      if (currentDayName.value == "monday") {
        await _firestore
            .collection('Step-details')
            .doc(_auth.currentUser!.uid)
            .update({
          'totalStepCount': totalSteps,
          'monday': 0,
          'tuesday': 0,
          'wednesday': 0,
          'thursday': 0,
          'friday': 0,
          'saturday': 0,
          'sunday': 0,
        });
        prefs.setInt('previousStepCount', totalSteps);
        prefs.setString('currentDay', currentDayName.value);
      } else {
        await _firestore
            .collection('Step-details')
            .doc(_auth.currentUser!.uid)
            .update({
          'totalStepCount': totalSteps,
          prevDayName.value: totalSteps - prevSteps,
        });
        prefs.setInt('previousStepCount', totalSteps);
        prefs.setString('currentDay', currentDayName.value);
      }
    }
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
  }

  Future<void> initPlatformState() async {
    final SharedPreferences prefs = await _prefs;
    _stepCountStream = Pedometer.stepCountStream;
    _steps.value = prefs.getInt('totalStepCount') ?? 0;
    _lastStepCount = _steps.value;
    print("totalSteps :${_steps.value}");
    print("prevday:${prefs.getInt('previousStepCount')}");
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }
}
