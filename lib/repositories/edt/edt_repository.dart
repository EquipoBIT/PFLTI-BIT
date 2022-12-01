import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/edt_model.dart';
import '/repositories/edt/base_edt_repository.dart';

class EdtRepository extends BaseEdtRepository {
  final FirebaseFirestore _firebaseFirestore;

  EdtRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Stream<List<Edt>> getAllEdts() {
    return _firebaseFirestore
        .collection('edts')
        .where('edtEstAsigId', isEqualTo: user!.uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Edt.fromSnapshot(doc)).toList();
    });
  }
}
