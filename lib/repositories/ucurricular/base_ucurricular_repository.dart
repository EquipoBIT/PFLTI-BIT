import '/models/models.dart';

abstract class BaseUCurricularRepository {
  Stream<List<UCurricular>> getAllUCurriculares();
}
