import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfltibit/models/models.dart';
import '/models/grupo_model.dart';
import '/repositories/grupo/base_grupo_repository.dart';

class GrupoRepository extends BaseGrupoRepository {
  final FirebaseFirestore _firebaseFirestore;

  GrupoRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Grupo>> getAllGrupos() {
    return _firebaseFirestore.collection('grupos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Grupo.fromSnapshot(doc)).toList();
    });
  }
}
