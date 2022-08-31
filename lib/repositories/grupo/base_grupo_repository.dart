import '/models/models.dart';

abstract class BaseGrupoRepository {
  Stream<List<Grupo>> getAllGrupos();
}
