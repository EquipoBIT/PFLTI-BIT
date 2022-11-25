// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StaticsScreen extends StatelessWidget {
  static const String routeName = '/static';

  StaticsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => StaticsScreen(),
    );
  }

  User? user = FirebaseAuth.instance.currentUser;
  //CollectionReference statics = FirebaseFirestore.instance.collection('uso');
  /*final QuerySnapshot result =
              await FirebaseFirestore.instance.collection('uso').get();
    final List<DocumentSnapshot> documents = result.docs;
*/

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Estadisticas"),
        ),
        body: FutureBuilder(
            future: FirebaseFirestore.instance.collection("uso").get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                QuerySnapshot<Object?>? documents = snapshot.data;
                List<DocumentSnapshot> docs = documents!.docs;
                docs.forEach((data) {
                  print(data.id);
                });
              } else {
                print("nodata");
              }
              return Container();
            }));
  }
}
