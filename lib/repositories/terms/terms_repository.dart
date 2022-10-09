import 'package:cloud_firestore/cloud_firestore.dart';
import '../repositories.dart';

class TermsRepository extends BaseTermsRepository {
  final FirebaseFirestore _firebaseFirestore;

  TermsRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> updateTerms(String uId) async {
    return _firebaseFirestore
        .collection('usuarios')
        .doc(uId)
        .update({'uAceptoTerminos': true});
  }
}
