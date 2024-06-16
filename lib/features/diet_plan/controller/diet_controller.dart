import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/model/diet_plan_model.dart';
import 'package:get/get.dart';

class DietController extends GetxController {
  @override
  void onInit() {
    initCall();
    super.onInit();
  }

  Future<void> initCall() async {
    loading.value = true;
    await calculateMacros();
    await fetchWeightLossData();
    loading.value = false;
    await fetchWeightGainData();
    await fetchNutritionalNeedData();
  }

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<ForAdultsPlanModel>? forAdultPlan = Rxn<ForAdultsPlanModel>();
  Rxn<ForOlderAgedPlanModel>? olderAgedPlan = Rxn<ForOlderAgedPlanModel>();
  Rxn<ForTeenPlanModel>? teenPlan = Rxn<ForTeenPlanModel>();
  Rxn<ForMiddleAgedModel>? middleAgedPlan = Rxn<ForMiddleAgedModel>();
  Rxn<MenopausalWomenModel>? menopausalPlan = Rxn<MenopausalWomenModel>();
  Rxn<PregnantWomenModel>? pregnantPlan = Rxn<PregnantWomenModel>();
  Rxn<SpecificConditionModel>? specificCondition =
      Rxn<SpecificConditionModel>();
  RxList<WeightPlanModel> weightGainVegList =
      RxList<WeightPlanModel>.empty(growable: true).obs();
  RxList<WeightPlanModel> weightGainNonVegList =
      RxList<WeightPlanModel>.empty(growable: true).obs();
  RxList<WeightPlanModel> weightLossVegList =
      RxList<WeightPlanModel>.empty(growable: true).obs();
  RxList<WeightPlanModel> weightLossNonVegList =
      RxList<WeightPlanModel>.empty(growable: true).obs();
  RxBool loading = false.obs;
  RxBool isMale = false.obs;
  int age = 0;
  String gender = "";
  RxInt maintenanceCals = 0.obs;
  RxDouble bmi = 0.0.obs;
  RxString bmiStatus = "".obs;
  RxString planSuggestion = "".obs;
  RxString calSuggestion = "".obs;
  Future<void> calculateMacros() async {
    final snapshot = await _database
        .child(_auth.currentUser!.uid)
        .child('User-Details')
        .get();
    Map<dynamic, dynamic>? map = snapshot.value as Map?;
    int age = int.parse(map!["selectedAge"].toString());
    String gender = map["selectedGender"].toString();
    double weight = convertToKg(map["selectedWeight"].toString());
    double activityLevel =
        double.parse(map["selectedActivityLevel"].toString());
    double height =
        double.parse(map["selectedHeight"].toString().replaceAll(' cm', ''));
    if (gender == "Male") {
      maintenanceCals.value =
          ((10 * weight + 6.25 * height - 5 * age + 5) * activityLevel).round();
    } else {
      maintenanceCals.value =
          ((10 * weight + 6.25 * height - 5 * age - 161) * activityLevel)
              .round();
    }
    bmi.value = await calculateBmi(height, weight);
    updateSuggestion(bmi.value);
  }

  void updateSuggestion(double bmi) {
    if (bmi < 18.5) {
      bmiStatus.value = "Underweight";
      calSuggestion.value = "Calorie surplus";
      planSuggestion.value =
          "You might need to gain some weight. We recommend you to check out our weight gain plan.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      bmiStatus.value = "Normal";
      calSuggestion.value = "Calorie maintenance";
      planSuggestion.value =
          "You have normal weight, if you want to gain muscles you can follow our recommended exercises and weight gain plan.";
    } else if (bmi >= 25 && bmi < 29.9) {
      bmiStatus.value = "Overweight";
      calSuggestion.value = "Calorie deficit";
      planSuggestion.value =
          "You might need to lose some weight. Consider a balanced diet with fewer calories follow out weight loss plan.";
    } else if (bmi >= 30) {
      bmiStatus.value = "Obese";
      calSuggestion.value = "Calorie deficit";
      planSuggestion.value =
          "It's advisable to consult with a healthcare provider for a personalized weight loss plan and checkout our weight loss plans as well.";
    }
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

  Future<String> getAgeGroup() async {
    final snapshot = await _database
        .child(_auth.currentUser!.uid)
        .child('User-Details')
        .get();
    Map<dynamic, dynamic>? map = snapshot.value as Map?;
    age = int.parse(map!["selectedAge"].toString());
    gender = map["selectedGender"];
    if (age > 17 && age < 26) {
      return "for_adults";
    } else if (age > 24 && age < 51) {
      return "for_middle_aged";
    } else if (age > 3 && age < 16) {
      return "for_teenagers";
    } else {
      return "for_old_age";
    }
  }

  Future<DatabaseEvent> fetchData(String path) async {
    return await _database.child(path).once();
  }

  Future<void> fetchNutritionalNeedData() async {
    String ageGroup = await getAgeGroup();
    final dataSnapshot =
        await fetchData('Diet/full_body/$ageGroup/plan_details');
    switch (ageGroup) {
      case "for_adults":
        forAdultPlan!.value =
            ForAdultsPlanModel.fromSnapshot(dataSnapshot.snapshot.value);
        break;
      case "for_middle_aged":
        middleAgedPlan!.value =
            ForMiddleAgedModel.fromSnapshot(dataSnapshot.snapshot.value);
        break;
      case "for_teenagers":
        teenPlan!.value =
            ForTeenPlanModel.fromSnapshot(dataSnapshot.snapshot.value);
        break;
      case "for_old_age":
        olderAgedPlan!.value =
            ForOlderAgedPlanModel.fromSnapshot(dataSnapshot.snapshot.value);
        break;
    }

    if (gender != "Male") {
      isMale.value = false;
    } else {
      isMale.value = true;
    }
    final menopausalData =
        await fetchData('Diet/full_body/menopausal_women/plan_details');
    final pregnantData =
        await fetchData('Diet/full_body/pregnant_women/plan_details');
    menopausalPlan!.value =
        MenopausalWomenModel.fromSnapshot(menopausalData.snapshot.value);
    pregnantPlan!.value =
        PregnantWomenModel.fromSnapshot(pregnantData.snapshot.value);
    final specificConditionData =
        await fetchData('Diet/full_body/specific_health_conditions/');
    specificCondition!.value = SpecificConditionModel.fromSnapshot(
        specificConditionData.snapshot.value);
  }

  Future<void> fetchWeightGainData() async {
    weightGainVegList.clear();
    weightGainNonVegList.clear();
    String ageGroup = await getAgeGroup();
    final weightGainNonVegSnapshot =
        await fetchData('Diet/weight_gain_non_veg/$ageGroup');
    final weightGainVegSnapshot =
        await fetchData('Diet/weight_gain_veg/$ageGroup');
    Map<dynamic, dynamic>? vegMap =
        weightGainNonVegSnapshot.snapshot.value as Map?;
    vegMap!.forEach((key, value) {
      WeightPlanModel weightPlanModel = WeightPlanModel.fromSnapshot(value);
      weightGainNonVegList.add(weightPlanModel);
    });
    weightGainNonVegList.refresh();
    Map<dynamic, dynamic>? nonVegMap =
        weightGainVegSnapshot.snapshot.value as Map?;
    nonVegMap!.forEach((key, value) {
      WeightPlanModel weightPlanModel = WeightPlanModel.fromSnapshot(value);
      weightGainVegList.add(weightPlanModel);
    });
    weightGainVegList.refresh();
  }

  Future<void> fetchWeightLossData() async {
    weightLossVegList.clear();
    weightLossNonVegList.clear();
    String ageGroup = await getAgeGroup();
    final weightGainNonVegSnapshot =
        await fetchData('Diet/weight_loss_non_veg/$ageGroup');
    final weightGainVegSnapshot =
        await fetchData('Diet/weight_loss_veg/$ageGroup');
    Map<dynamic, dynamic>? vegMap =
        weightGainNonVegSnapshot.snapshot.value as Map?;
    vegMap!.forEach((key, value) {
      WeightPlanModel weightPlanModel = WeightPlanModel.fromSnapshot(value);
      weightLossNonVegList.add(weightPlanModel);
    });
    weightLossNonVegList.refresh();
    Map<dynamic, dynamic>? nonVegMap =
        weightGainVegSnapshot.snapshot.value as Map?;
    nonVegMap!.forEach((key, value) {
      WeightPlanModel weightPlanModel = WeightPlanModel.fromSnapshot(value);
      weightLossVegList.add(weightPlanModel);
    });
    weightLossVegList.refresh();
  }
}
