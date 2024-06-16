class DisabledFormModel{
  late bool? selectedGender;
  late bool? selectedMotivation;
  late bool? selectedTypeOfDisability;
  late bool? selectedPreviousWorkout;
  late bool? selectedWorkoutDays;
  late bool? selectedHeightWeight;

  DisabledFormModel();

  DisabledFormModel.fromSnapshot(dynamic value):
        selectedGender = value["selectedGender"],
        selectedMotivation = value["selectedMotivation"],
        selectedTypeOfDisability = value["selectedTypeOfDisability"],
        selectedPreviousWorkout = value["selectedPreviousWorkout"],
        selectedWorkoutDays = value["selectedWorkoutDays"],
        selectedHeightWeight = value["selectedHeightWeight"];

}