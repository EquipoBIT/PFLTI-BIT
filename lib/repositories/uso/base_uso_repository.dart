import '/models/models.dart';

abstract class BaseUsoRepository {
  Stream<List<Uso>> getAllUsos();
}
