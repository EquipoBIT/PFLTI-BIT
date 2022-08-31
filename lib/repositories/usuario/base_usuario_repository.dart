import '/models/models.dart';

abstract class BaseUserRepository {
  Stream<Usuario> getUser(String userId);
  Future<void> createUser(Usuario user);
  Future<void> updateUser(Usuario user);
}
