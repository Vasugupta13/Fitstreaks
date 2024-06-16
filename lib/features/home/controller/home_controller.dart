import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/controller/pedometer_controller.dart';
import 'package:fitstreaks/features/auth/view/login_view.dart';
import 'package:fitstreaks/features/home/views/home_view.dart';
import 'package:fitstreaks/model/step_details_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late DateTime now;
  late DateTime previousDay;
  var gender = "".obs;
  RxInt age = 0.obs;
  RxDouble weight = 0.0.obs;
  RxDouble height = 0.0.obs;

  final RxString _userName = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  var isDisabled = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<StepDetails> stepDetails = Rx<StepDetails>(StepDetails(
    totalStepCount: 0,
    monday: 0,
    tuesday: 0,
    wednesday: 0,
    thursday: 0,
    friday: 0,
    saturday: 0,
    sunday: 0,
  ));

  RxInt steps = 0.obs;
  RxString currentDayName = "".obs;
  RxString previousDayName = "".obs;
  RxString typeOfDisability = "".obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }
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
  Future<void> calculateMacros() async {
    final snapshot = await _database
        .child(_auth.currentUser!.uid)
        .child('User-Details')
        .get();
    Map<dynamic, dynamic>? map = snapshot.value as Map?;
    age.value  = int.parse(map!["selectedAge"].toString());
    gender.value = map["selectedGender"].toString();
    weight.value = convertToKg(map["selectedWeight"].toString());
    height.value = double.parse(map["selectedHeight"].toString().replaceAll(' cm', ''));
  }
   Future<void> init() async {
     await isLocoOrAmp();
     now = DateTime.now();
     previousDay = now.subtract(const Duration(days: 1));
     previousDayName.value = DateFormat('EEEE').format(previousDay).toLowerCase();
     currentDayName.value = DateFormat('EEEE').format(now).toLowerCase();
     fetchStepDetails();
     calculateMacros();
   }

  String showUserName() {
    _userName.value = _auth.currentUser!.displayName.toString();
    return _userName.value;
  }
 Future<void> showCurrentSteps() async {
   final SharedPreferences prefs = await _prefs;
   int totalSteps = prefs.getInt("totalStepCount") ?? 0;
   int prevSteps = prefs.getInt("previousStepCount")!;
   steps.value = totalSteps - prevSteps;
  }
  Future<void> fetchStepDetails() async {
    final doc = await _firestore.collection('Step-details').doc(_auth.currentUser!.uid).get();
    stepDetails.value = StepDetails.fromMap(doc.data()!);
  }
  Future<void> isLocoOrAmp() async {
    isLoading.value = true;
   final snapshot = await _database.child(_auth.currentUser!.uid).child('User-Details').child('isDisabled').get();
        if(snapshot.exists){
          bool disabled = snapshot.value.toString() == "true" ? true : false;
          if(!disabled){
            Future<PedometerController> initializeControllers() async {
              final controller = PedometerController();
               await controller.init();
              return controller;
            }
            Get.putAsync(initializeControllers,permanent: true);
            isLoading.value = false;
            Get.offAll(()=>const HomeView(isDisabled: false,));
          }else{
            final isLocomotorOrAmp = await _database.child(_auth.currentUser!.uid).child('User-Details').child('selectedTypeOfDisability').get();
            typeOfDisability.value = isLocomotorOrAmp.value.toString();
            if(typeOfDisability.value == "Locomotor" || typeOfDisability.value == "Amputee"){
              isDisabled.value = true;
            }
            isLoading.value = false;
            Get.offAll(()=>const HomeView(isDisabled: true,));
          }

  }
}
Future<void> logout() async {
  final SharedPreferences prefs = await _prefs;
    await _auth.signOut();
    await prefs.remove("totalStepCount");
    await prefs.remove("previousStepCount");
    await prefs.remove("stepGoal");
    await prefs.remove("currentDay");
    Get.offAll(() => const LoginView());
  }
}
