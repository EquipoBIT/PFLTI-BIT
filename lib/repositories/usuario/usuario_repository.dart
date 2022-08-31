import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfltibit/models/usuario_model.dart';

import 'base_usuario_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(Usuario usuario) async {
    bool userExist =
        (await _firebaseFirestore.collection('usuarios').doc(usuario.uId).get())
            .exists;

    if (userExist) {
      return;
    } else {
      await _firebaseFirestore
          .collection('usuarios')
          .doc(usuario.uId)
          .set(usuario.toDocument());
    }
  }

  @override
  Stream<Usuario> getUser(String uId) {
    print('Getting user data from Cloud Firestore');
    return _firebaseFirestore
        .collection('usuarios')
        .doc(uId)
        .snapshots()
        .map((snap) {
      return Usuario.fromSnapshot(snap);
    });
  }

  @override
  Future<void> updateUser(Usuario usuario) async {
    return _firebaseFirestore
        .collection('usuarios')
        .doc(usuario.uId)
        .update(usuario.toDocument())
        .then(
          (value) => print('User document updated.'),
        );
  }
}
