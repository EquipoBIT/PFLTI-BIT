import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future getStatics() async {
  User? user = FirebaseAuth.instance.currentUser;
  var uid = user?.uid;

  var data = await FirebaseFirestore.instance
      .collection('uso')
      .where('usoEdtEstAsigId', isEqualTo: uid)
      .orderBy('usoOff', descending: true)
      .get();
}

/*
Firestore.instance.collection('collection').where('field', isEqualTo: 'value').orderBy()
  .snapshots()
  .listen((QuerySnapshot querySnapshot){
    querySnapshot.documents.forEach((document) => print(document));
  }
);


  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Uso').get();
  final data = querySnapshot.docs.map((doc) => doc.data());
  return data;
*/
