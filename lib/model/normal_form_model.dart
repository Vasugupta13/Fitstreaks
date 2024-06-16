class NormalFormModel{
  late bool? selectedGender;
  late bool? selectedMotivation;
  late bool? selectedPushUpLevel;
  late bool? selectedActivityLevel;
  late bool? selectedWorkoutDays;
  late bool? selectedHeightWeight;

  NormalFormModel();

  NormalFormModel.fromSnapshot(dynamic value):
        selectedGender = value["selectedGender"],
        selectedMotivation = value["selectedMotivation"],
        selectedPushUpLevel = value["selectedPushUpLevel"],
        selectedActivityLevel = value["selectedActivityLevel"],
        selectedWorkoutDays = value["selectedWorkoutDays"],
        selectedHeightWeight = value["selectedHeightWeight"];

}