import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/edt_model.dart';
import '/repositories/edt/base_edt_repository.dart';

class EdtRepository extends BaseEdtRepository {
  final FirebaseFirestore _firebaseFirestore;

  EdtRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Edt>> getAllEdts() {
    return _firebaseFirestore.collection('edts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Edt.fromSnapshot(doc)).toList();
    });
  }
}
