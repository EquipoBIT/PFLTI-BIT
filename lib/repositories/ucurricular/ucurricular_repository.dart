import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfltibit/models/models.dart';
import '/models/ucurricular_model.dart';
import '/repositories/ucurricular/base_ucurricular_repository.dart';

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
