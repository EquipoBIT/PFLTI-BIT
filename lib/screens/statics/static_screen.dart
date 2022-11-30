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
      builder: (_) => StaticsScreen(),
    );
  }

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _usoStream = FirebaseFirestore.instance
        .collection('uso')
        // comentar la linea de abajo para ver la lista de todos los usuarios
        .where('usoEdtEstAsigId', isEqualTo: user!.uid)
        .orderBy("usoOn", descending: true)
        .snapshots();
    return Scaffold(
      appBar: MyAppBar(title: 'Estadisticas de uso'),
      bottomNavigationBar: const MyNavBar(screen: routeName),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usoStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(
                      "Cargando datos si existen",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Lista de uso de tus EDTs',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Flexible(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    'Nombre del EDT: ${snapshot.data!.docs[index].get('usoEdtNombre')}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    'Minutos usados: ${snapshot.data!.docs[index].get('usoMinutos')}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      // El de abajo muestra mejor la fecha pero deja un error al final de la lista
                                      //'Fecha y hora de apagado: ${snapshot.data!.docs[index].get('usoOn').toDate()}',
                                      'Fecha y hora de encendido: ${snapshot.data!.docs[index].get('usoOn')}',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      // El de abajo muestra mejor la fecha pero deja un error al final de la lista
                                      //'Fecha y hora de apagado: ${snapshot.data!.docs[index].get('usoOff').toDate()}',
                                      'Fecha y hora de apagado: ${snapshot.data!.docs[index].get('usoOff')}',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Grupo: ${snapshot.data!.docs[index].get('usoEdtGrupo')}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Unidad Curricular: ${snapshot.data!.docs[index].get('usoEdtUC')}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
