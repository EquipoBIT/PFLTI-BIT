import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class UsoScreen extends StatelessWidget {
  static const String routeName = '/uso';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => UsoScreen(),
    );
  }

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Estadisticas de uso'),
      bottomNavigationBar: const MyNavBar(screen: routeName),
      body: FirestoreListView(
        query: FirebaseFirestore.instance
            .collection('uso')
            .where('usoEdtEstAsigId', isEqualTo: user!.uid)
            .orderBy('usoOn', descending: true),
        loadingBuilder: (_) => CircularProgressIndicator(),
        itemBuilder: ((context, snapshot) {
          Map<String, dynamic> data = snapshot.data();
          Timestamp tOn = data['usoOn'] as Timestamp;
          DateTime dateOn = tOn.toDate();
          Timestamp tOff = data['usoOff'] as Timestamp;
          DateTime dateOff = tOff.toDate();
          return ListTile(
            title: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Nombre del EDT: ${data['usoEdtNombre']}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Minutos usados: ${data['usoMinutos']}',
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
                        'Fecha y hora de encendido: ${dateOn.day} / ${dateOn.month} / ${dateOn.year}  ${dateOn.hour}: ${dateOn.minute}',
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
                        'Fecha y hora de apagado: ${dateOff.day} / ${dateOff.month} / ${dateOff.year}  ${dateOff.hour}: ${dateOff.minute}',
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
                        'Grupo: ${data['usoEdtGrupo']}',
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
                        'Unidad Curricular: ${data['usoEdtUC']}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            );         
        }),
      )
    );
  }
}


