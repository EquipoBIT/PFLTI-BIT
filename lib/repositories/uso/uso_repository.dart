import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfltibit/models/models.dart';
import '/repositories/repositories.dart';

class UsoRepository extends BaseUsoRepository {
  final FirebaseFirestore _firebaseFirestore;

  UsoRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Uso>> getAllUsos() {
    return _firebaseFirestore
        .collection('uso')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Uso.fromSnapshot(doc)).toList();
    });
  }
}
