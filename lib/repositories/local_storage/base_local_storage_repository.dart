import 'package:hive/hive.dart';

import '/models/models.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> openBox();
  List<Edt> getEnUso(Box box);
  Future<void> addEdtToEnUso(Box box, Edt edt);
  Future<void> removeEdtFromEnUso(Box box, Edt edt);
  Future<void> clearEnUso(Box box);
}
