class FullBodyDietPlanModel {
  Adolescents adolescents;
  Adults adults;
  Children children;
  OlderAdults olderAdults;

  FullBodyDietPlanModel({
    required this.adolescents,
    required this.adults,
    required this.children,
    required this.olderAdults,
  });

  factory FullBodyDietPlanModel.fromMap(dynamic json) => FullBodyDietPlanModel(
        adolescents: Adolescents.fromMap(json["adolescents"]),
        adults: Adults.fromMap(json["adults"]),
        children: Children.fromMap(json["children"]),
        olderAdults: OlderAdults.fromMap(json["older_adults"]),
      );

  Map<String, dynamic> toMap() => {
        "adolescents": adolescents.toMap(),
        "adults": adults.toMap(),
        "children": children.toMap(),
        "older_adults": olderAdults.toMap(),
      };
}

class Adolescents {
  String activityLevel;
  String ageRange;
  String gender;
  String healthStatus;
  ForAdultsPlanModel planDetails;

  Adolescents({
    required this.activityLevel,
    required this.ageRange,
    required this.gender,
    required this.healthStatus,
    required this.planDetails,
  });

  factory Adolescents.fromMap(dynamic json) => Adolescents(
        activityLevel: json["activity_level"],
        ageRange: json["age_range"],
        gender: json["gender"],
        healthStatus: json["health_status"],
        planDetails: ForAdultsPlanModel.fromSnapshot(json["plan_details"]),
      );

  Map<String, dynamic> toMap() => {
        "activity_level": activityLevel,
        "age_range": ageRange,
        "gender": gender,
        "health_status": healthStatus,
        "plan_details": planDetails.toMap(),
      };
}

class ForAdultsPlanModel {
  String balancedNutrition;
  String calciumAndVitaminD;
  String hydration;
  String mealTiming;
  String monitorNutrientIntake;

  ForAdultsPlanModel({
    required this.balancedNutrition,
    required this.calciumAndVitaminD,
    required this.hydration,
    required this.mealTiming,
    required this.monitorNutrientIntake,
  });

  factory ForAdultsPlanModel.fromSnapshot(dynamic json) =>
      ForAdultsPlanModel(
        balancedNutrition: json["Balanced Nutrition"],
        calciumAndVitaminD: json["Calcium and Vitamin D"],
        hydration: json["Hydration"],
        mealTiming: json["Meal Timing"],
        monitorNutrientIntake: json["Monitor Nutrient Intake"],
      );

  Map<String, dynamic> toMap() => {
        "Balanced Nutrition": balancedNutrition,
        "Calcium and Vitamin D": calciumAndVitaminD,
        "Hydration": hydration,
        "Meal Timing": mealTiming,
        "Monitor Nutrient Intake": monitorNutrientIntake,
      };
}

class Adults {
  String activityLevel;
  String ageRange;
  String gender;
  String healthStatus;
  ForMiddleAgedModel planDetails;

  Adults({
    required this.activityLevel,
    required this.ageRange,
    required this.gender,
    required this.healthStatus,
    required this.planDetails,
  });

  factory Adults.fromMap(dynamic json) => Adults(
        activityLevel: json["activity_level"],
        ageRange: json["age_range"],
        gender: json["gender"],
        healthStatus: json["health_status"],
        planDetails: ForMiddleAgedModel.fromSnapshot(json["plan_details"]),
      );

  Map<String, dynamic> toMap() => {
        "activity_level": activityLevel,
        "age_range": ageRange,
        "gender": gender,
        "health_status": healthStatus,
        "plan_details": planDetails.toMap(),
      };
}

class ForMiddleAgedModel {
  String complexCarbohydrates;
  String healthyFats;
  String hydration;
  String leanProteins;
  String mealTiming;
  String portionControl;
  String preAndPostWorkoutNutrition;

  ForMiddleAgedModel({
    required this.complexCarbohydrates,
    required this.healthyFats,
    required this.hydration,
    required this.leanProteins,
    required this.mealTiming,
    required this.portionControl,
    required this.preAndPostWorkoutNutrition,
  });

  factory ForMiddleAgedModel.fromSnapshot(dynamic json) => ForMiddleAgedModel(
        complexCarbohydrates: json["Complex Carbohydrates"],
        healthyFats: json["Healthy Fats"],
        hydration: json["Hydration"],
        leanProteins: json["Lean Proteins"],
        mealTiming: json["Meal Timing"],
        portionControl: json["Portion Control"],
        preAndPostWorkoutNutrition: json["Pre- and Post-Workout Nutrition"],
      );

  Map<String, dynamic> toMap() => {
        "Complex Carbohydrates": complexCarbohydrates,
        "Healthy Fats": healthyFats,
        "Hydration": hydration,
        "Lean Proteins": leanProteins,
        "Meal Timing": mealTiming,
        "Portion Control": portionControl,
        "Pre- and Post-Workout Nutrition": preAndPostWorkoutNutrition,
      };
}

class Children {
  String activityLevel;
  String ageRange;
  String gender;
  String healthStatus;
  ForTeenPlanModel planDetails;

  Children({
    required this.activityLevel,
    required this.ageRange,
    required this.gender,
    required this.healthStatus,
    required this.planDetails,
  });

  factory Children.fromMap(dynamic json) => Children(
        activityLevel: json["activity_level"],
        ageRange: json["age_range"],
        gender: json["gender"],
        healthStatus: json["health_status"],
        planDetails: ForTeenPlanModel.fromSnapshot(json["plan_details"]),
      );

  Map<String, dynamic> toMap() => {
        "activity_level": activityLevel,
        "age_range": ageRange,
        "gender": gender,
        "health_status": healthStatus,
        "plan_details": planDetails.toMap(),
      };
}

class ForTeenPlanModel {
  String encourageFruitsAndVegetables;
  String familyMeals;
  String limitAddedSugarsAndProcessedFoods;
  String properPortions;
  String varietyAndBalance;

  ForTeenPlanModel({
    required this.encourageFruitsAndVegetables,
    required this.familyMeals,
    required this.limitAddedSugarsAndProcessedFoods,
    required this.properPortions,
    required this.varietyAndBalance,
  });

  factory ForTeenPlanModel.fromSnapshot(dynamic json) => ForTeenPlanModel(
        encourageFruitsAndVegetables: json["Encourage Fruits and Vegetables"],
        familyMeals: json["Family Meals"],
        limitAddedSugarsAndProcessedFoods:
            json["Limit Added Sugars and Processed Foods"],
        properPortions: json["Proper Portions"],
        varietyAndBalance: json["Variety and Balance"],
      );

  Map<String, dynamic> toMap() => {
        "Encourage Fruits and Vegetables": encourageFruitsAndVegetables,
        "Family Meals": familyMeals,
        "Limit Added Sugars and Processed Foods":
            limitAddedSugarsAndProcessedFoods,
        "Proper Portions": properPortions,
        "Variety and Balance": varietyAndBalance,
      };
}

class OlderAdults {
  String activityLevel;
  String ageRange;
  String gender;
  String healthStatus;
  ForOlderAgedPlanModel planDetails;

  OlderAdults({
    required this.activityLevel,
    required this.ageRange,
    required this.gender,
    required this.healthStatus,
    required this.planDetails,
  });

  factory OlderAdults.fromMap(dynamic json) => OlderAdults(
        activityLevel: json["activity_level"],
        ageRange: json["age_range"],
        gender: json["gender"],
        healthStatus: json["health_status"],
        planDetails: ForOlderAgedPlanModel.fromSnapshot(json["plan_details"]),
      );

  Map<String, dynamic> toMap() => {
        "activity_level": activityLevel,
        "age_range": ageRange,
        "gender": gender,
        "health_status": healthStatus,
        "plan_details": planDetails.toMap(),
      };
}

class ForOlderAgedPlanModel {
  String considerationsForChronicConditions;
  String focusOnNutrientDensity;
  String hydration;
  String increaseCalciumAndVitaminD;
  String maintainProteinIntake;

  ForOlderAgedPlanModel({
    required this.considerationsForChronicConditions,
    required this.focusOnNutrientDensity,
    required this.hydration,
    required this.increaseCalciumAndVitaminD,
    required this.maintainProteinIntake,
  });

  factory ForOlderAgedPlanModel.fromSnapshot(dynamic json) =>
      ForOlderAgedPlanModel(
        considerationsForChronicConditions:
            json["Considerations for Chronic Conditions"],
        focusOnNutrientDensity: json["Focus on Nutrient Density"],
        hydration: json["Hydration"],
        increaseCalciumAndVitaminD: json["Increase Calcium and Vitamin D"],
        maintainProteinIntake: json["Maintain Protein Intake"],
      );

  Map<String, dynamic> toMap() => {
        "Considerations for Chronic Conditions":
            considerationsForChronicConditions,
        "Focus on Nutrient Density": focusOnNutrientDensity,
        "Hydration": hydration,
        "Increase Calcium and Vitamin D": increaseCalciumAndVitaminD,
        "Maintain Protein Intake": maintainProteinIntake,
      };
}

class MenopausalWomenModel {
  String calciumAndVitaminD;
  String fiberRichFoods;
  String heartHealthyFats;
  String hydration;
  String phytoestrogens;

  MenopausalWomenModel({
    required this.calciumAndVitaminD,
    required this.fiberRichFoods,
    required this.heartHealthyFats,
    required this.hydration,
    required this.phytoestrogens,
  });

  factory MenopausalWomenModel.fromSnapshot(dynamic json) => MenopausalWomenModel(
        calciumAndVitaminD: json["Calcium and Vitamin D"],
        fiberRichFoods: json["Fiber-Rich Foods"],
        heartHealthyFats: json["Heart-Healthy Fats"],
        hydration: json["Hydration"],
        phytoestrogens: json["Phytoestrogens"],
      );

  Map<String, dynamic> toMap() => {
        "Calcium and Vitamin D": calciumAndVitaminD,
        "Fiber-Rich Foods": fiberRichFoods,
        "Heart-Healthy Fats": heartHealthyFats,
        "Hydration": hydration,
        "Phytoestrogens": phytoestrogens,
      };
}
class PregnantWomenModel {
  String avoidCertainFoods;
  String balancedMeals;
  String folateAndIron;
  String hydration;
  String omega3FattyAcids;

  PregnantWomenModel({
    required this.avoidCertainFoods,
    required this.balancedMeals,
    required this.folateAndIron,
    required this.hydration,
    required this.omega3FattyAcids,
  });

  factory PregnantWomenModel.fromSnapshot(dynamic json) => PregnantWomenModel(
    avoidCertainFoods: json["Avoid Certain Foods"],
    balancedMeals: json["Balanced Meals"],
    folateAndIron: json["Folate and Iron"],
    hydration: json["Hydration"],
    omega3FattyAcids: json["Omega-3 Fatty Acids"],
  );

  Map<String, dynamic> toMap() => {
    "Avoid Certain Foods": avoidCertainFoods,
    "Balanced Meals": balancedMeals,
    "Folate and Iron": folateAndIron,
    "Hydration": hydration,
    "Omega-3 Fatty Acids": omega3FattyAcids,
  };
}
class SpecificConditionModel {
  String diabetes;
  String digestiveDisorders;
  String foodAllergiesOrIntolerances;
  String heartDisease;
  String hypertension;

  SpecificConditionModel({
    required this.diabetes,
    required this.digestiveDisorders,
    required this.foodAllergiesOrIntolerances,
    required this.heartDisease,
    required this.hypertension,
  });

  factory SpecificConditionModel.fromSnapshot(dynamic json) => SpecificConditionModel(
    diabetes: json["Diabetes"],
    digestiveDisorders: json["Digestive Disorders"],
    foodAllergiesOrIntolerances: json["Food Allergies or Intolerances"],
    heartDisease: json["Heart Disease"],
    hypertension: json["Hypertension"],
  );

  Map<String, dynamic> toMap() => {
    "Diabetes": diabetes,
    "Digestive Disorders": digestiveDisorders,
    "Food Allergies or Intolerances": foodAllergiesOrIntolerances,
    "Heart Disease": heartDisease,
    "Hypertension": hypertension,
  };
}

class WeightPlanModel {
  String afternoonSnack;
  String breakfast;
  String dinner;
  String lunch;
  String midMorningSnack;

  WeightPlanModel({
    required this.afternoonSnack,
    required this.breakfast,
    required this.dinner,
    required this.lunch,
    required this.midMorningSnack,
  });

  factory WeightPlanModel.fromSnapshot( dynamic json) => WeightPlanModel(
    breakfast: json["Breakfast"],
    midMorningSnack: json["Mid-Morning Snack"],
    lunch: json["Lunch"],
    afternoonSnack: json["Afternoon Snack"],
    dinner: json["Dinner"],
  );

  Map<String, dynamic> toMap() => {
    "Afternoon Snack": afternoonSnack,
    "Breakfast": breakfast,
    "Dinner": dinner,
    "Lunch": lunch,
    "Mid-Morning Snack": midMorningSnack,
  };
}
