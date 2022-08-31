import '/models/models.dart';

abstract class BaseEdtRepository {
  Stream<List<Edt>> getAllEdts();
}
