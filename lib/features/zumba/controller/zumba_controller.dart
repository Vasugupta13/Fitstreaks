import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/model/zumba_model.dart';
import 'package:get/get.dart';

class ZumbaController extends GetxController{
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final RxBool _loading = false.obs;
  final RxBool isExpanded = false.obs;

  Rxn<ZumbaInstructionModel> zumbaInstructions = Rxn<ZumbaInstructionModel>();
  RxList<ZumbaRoutineModel> zumbaRoutineList = List<ZumbaRoutineModel>.empty(growable: true).obs;
  bool get loading => _loading.value;


  void switchExpanded(bool expanded){

  }
  Future<void> fetchZumbaInstructions() async {
    zumbaRoutineList.clear();
    _loading.value = true;
    final dataSnapshot = await _database.child('Zumba').child('diet_structure').once();
    final routineSnapshot = await _database.child('Zumba').child('routines').once();
    Map<dynamic, dynamic>? map = routineSnapshot.snapshot.value as Map?;
    map!.forEach((key, value) {
      ZumbaRoutineModel zumbaRoutine = ZumbaRoutineModel.fromSnapshot(value);
      zumbaRoutineList.add(zumbaRoutine);
    });
    zumbaInstructions.value = ZumbaInstructionModel.fromSnapshot(dataSnapshot.snapshot.value);
    _loading.value = false;
  }


}