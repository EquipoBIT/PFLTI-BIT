import 'package:hive/hive.dart';

import '/repositories/repositories.dart';
import '/models/models.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  String boxName = 'enuso_edts';
  Type boxType = Edt;

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Edt>(boxName);
    return box;
  }

  @override
  List<Edt> getEnUso(Box box) {
    return box.values.toList() as List<Edt>;
  }

  @override
  Future<void> addEdtToEnUso(Box box, Edt edt) async {
    await box.put(edt.edtId, edt);
  }

  @override
  Future<void> removeEdtFromEnUso(Box box, Edt edt) async {
    await box.delete(edt.edtId);
  }

  @override
  Future<void> clearEnUso(Box box) async {
    await box.clear();
  }
}
