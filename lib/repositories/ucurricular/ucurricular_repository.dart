import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfltibit/models/models.dart';
import '/repositories/repositories.dart';

class UCurricularRepository extends BaseUCurricularRepository {
  final FirebaseFirestore _firebaseFirestore;

  UCurricularRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<UCurricular>> getAllUCurriculares() {
    return _firebaseFirestore
        .collection('ucurriculares')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UCurricular.fromSnapshot(doc)).toList();
    });
  }
}
