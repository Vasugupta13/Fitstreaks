class FullBodyStretchingModel {
  String duration;
  String cals;
  String instructions;
  String name;
  String image;

  FullBodyStretchingModel({
    required this.duration,
    required this.cals,
    required this.instructions,
    required this.name,
    required this.image,
  });

  factory FullBodyStretchingModel.fromSnapshot(dynamic json) => FullBodyStretchingModel(
    duration: json["duration"],
    cals: json["cals"],
    instructions: json["instructions"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "duration": duration,
    "cals": cals,
    "instructions": instructions,
    "name": name,
    "image": image,
  };
}

class LowerBodyStretchingModel {
  String image;
  String butterflyStretch;
  String hamstringStretch;
  String standingQuadStretch;

  LowerBodyStretchingModel({
    required this.image,
    required this.butterflyStretch,
    required this.hamstringStretch,
    required this.standingQuadStretch,
  });

  factory LowerBodyStretchingModel.fromSnapshot(dynamic json) => LowerBodyStretchingModel(
    image: json["image"],
    butterflyStretch: json["Butterfly Stretch"],
    hamstringStretch: json["Hamstring Stretch"],
    standingQuadStretch: json["Standing Quad Stretch"],
  );
}

class MorningWarmupModel {
  String image;
  String dynamicMovements;
  String lightCardio;

  MorningWarmupModel({
    required this.image,
    required this.dynamicMovements,
    required this.lightCardio,
  });

  factory MorningWarmupModel.fromSnapshot(dynamic json) => MorningWarmupModel(
    image: json["image"],
    dynamicMovements: json["Dynamic Movements"],
    lightCardio: json["Light Cardio"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "Dynamic Movements": dynamicMovements,
    "Light Cardio": lightCardio,
  };
}

class ShoulderTensionModel {
  String image;
  String neckRolls;
  String shoulderRolls;
  String shoulderShrugs;

  ShoulderTensionModel({
    required this.image,
    required this.neckRolls,
    required this.shoulderRolls,
    required this.shoulderShrugs,
  });

  factory ShoulderTensionModel.fromSnapshot(dynamic json) => ShoulderTensionModel(
    image: json["image"],
    neckRolls: json["Neck Rolls"],
    shoulderRolls: json["Shoulder Rolls"],
    shoulderShrugs: json["Shoulder Shrugs"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "Neck Rolls": neckRolls,
    "Shoulder Rolls": shoulderRolls,
    "Shoulder Shrugs": shoulderShrugs,
  };
}
class UpperBodyStretchingModel {
  String image;
  String chestOpener;
  String tricepsStretch;

  UpperBodyStretchingModel({
    required this.image,
    required this.chestOpener,
    required this.tricepsStretch,
  });

  factory UpperBodyStretchingModel.fromSnapshot(dynamic json) => UpperBodyStretchingModel(
    image: json["image"],
    chestOpener: json["Chest Opener"],
    tricepsStretch: json["Triceps Stretch"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "Chest Opener": chestOpener,
    "Triceps Stretch": tricepsStretch,
  };
}