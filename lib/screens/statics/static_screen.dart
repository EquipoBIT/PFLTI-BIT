// ignore_for_file: must_be_immutable

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class StaticsScreen extends StatelessWidget {
  static const String routeName = '/static';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => StaticsScreen(),
    );
  }

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _usoStream = FirebaseFirestore.instance
        .collection('uso')
        .where('usoEdtEstAsigId', isEqualTo: user!.uid)
        //.orderBy("usoOn", descending: true)
        .snapshots();
    return Scaffold(
      appBar: MyAppBar(title: 'Estadisticas de uso'),
      bottomNavigationBar: const MyNavBar(screen: routeName),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usoStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("No hay datos de uso");
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Nombre del EDT: ${snapshot.data!.docs[index].get('usoEdtNombre')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Minutos usados: ${snapshot.data!.docs[index].get('usoMinutos')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fecha y hora de encendido: ${snapshot.data!.docs[index].get('usoOn').toDate()}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fecha y hora de apagado: ${snapshot.data!.docs[index].get('usoOff').toDate()}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Grupo: ${snapshot.data!.docs[index].get('usoEdtGrupo')}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Unidad Curricular: ${snapshot.data!.docs[index].get('usoEdtUC')}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}




//new ListView(children: getStatics(snapshot));
/*
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Estadisticas de uso'),
      bottomNavigationBar: const MyNavBar(screen: routeName),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("uso").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("No hay datos de uso");
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: snapshot.data!.docs[index].data()['usoEdtNombre'],
                leading: snapshot.data!.docs[index].data()['usoMinutos'],
              );
            },
          );
        },
      ),
    );
  }
}*/




/*
 CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('uso');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }*/








/*
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class StaticsScreen extends StatelessWidget {
  static const String routeName = '/static';

  static Route route({required Uso uso}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => StaticsScreen(uso: uso),
    );
  }

  final Uso uso;

  const StaticsScreen({
    super.key,
    required this.uso,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Estadisticas de uso'),
      body: UsoInfo(uso: uso),
    );
  }
}

class UsoInfo extends StatelessWidget {
  const UsoInfo({
    Key? key,
    required this.uso,
  }) : super(key: key);
  final Uso uso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Nombre del EDT: ${uso.usoEdtNombre}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'Minutos usados: ${uso.usoMinutos}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    'Detalles del uso',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Fecha y hora de encendido: ${uso.usoOn}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Fecha y hora de apagado: ${uso.usoOff}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Grupo: ${uso.usoEdtGrupo}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Unidad Curricular: ${uso.usoEdtUC}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
  */



  //CollectionReference statics = FirebaseFirestore.instance.collection('uso');
  /*final QuerySnapshot result =
              await FirebaseFirestore.instance.collection('uso').get();
    final List<DocumentSnapshot> documents = result.docs;
*/

 /* Widget build(BuildContext context) {
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
  }*/


