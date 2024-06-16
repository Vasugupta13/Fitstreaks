import 'package:fitstreaks/model/stretching_model.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class StretchController extends GetxController {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final RxBool _loading = false.obs;

  RxList<FullBodyStretchingModel> fullBodyStretchList = List<FullBodyStretchingModel>.empty(growable: true).obs;
  Rxn<LowerBodyStretchingModel> lowerBodyStretching = Rxn<LowerBodyStretchingModel>();
  Rxn<UpperBodyStretchingModel> upperBodyStretching = Rxn<UpperBodyStretchingModel>();
  Rxn<ShoulderTensionModel> shoulderTension = Rxn<ShoulderTensionModel>();
  Rxn<MorningWarmupModel> morningWarmup = Rxn<MorningWarmupModel>();

  bool get loading => _loading.value;

  Future<void> fetchFullBodyStretches() async {
    fullBodyStretchList.clear();
    _loading.value = true;
    final dataSnapshot = await _database.child('Stretching').child('full_body').once();
    Map<dynamic, dynamic>? map = dataSnapshot.snapshot.value as Map?;
    map!.forEach((key, value) {
      FullBodyStretchingModel fullBodyStretch = FullBodyStretchingModel.fromSnapshot(value);
      fullBodyStretchList.add(fullBodyStretch);
    });
    _loading.value = false;
  }
  Future<void> fetchLowerBodyStretch() async {
    _loading.value = true;
    final dataSnapshot = await _database.child('Stretching').child('lower_body_stretching').once();
    lowerBodyStretching.value = LowerBodyStretchingModel.fromSnapshot(dataSnapshot.snapshot.value);
    _loading.value = false;
  }
  Future<void> fetchUpperBodyStretch() async {
    _loading.value = true;
    final dataSnapshot = await _database.child('Stretching').child('upper_body_stretching').once();
    upperBodyStretching.value = UpperBodyStretchingModel.fromSnapshot(dataSnapshot.snapshot.value);
    _loading.value = false;
  }
  Future<void> fetchShoulderTensionStretch() async {
    _loading.value = true;
    final dataSnapshot = await _database.child('Stretching').child('shoulder_tension_relief').once();
    shoulderTension.value = ShoulderTensionModel.fromSnapshot(dataSnapshot.snapshot.value);
    _loading.value = false;
  }
  Future<void> fetchMorningWarmUp() async {
    _loading.value = true;
    final dataSnapshot = await _database.child('Stretching').child('morning_warmup').once();
    morningWarmup.value = MorningWarmupModel.fromSnapshot(dataSnapshot.snapshot.value);
    _loading.value = false;
  }
}