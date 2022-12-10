// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
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
        pageSize: 20,
        query: FirebaseFirestore.instance
            .collection('uso')
            //.where('usoEdtEstAsigId', isEqualTo: user!.uid)
            .orderBy('usoOn', descending: true),
        loadingBuilder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ],
        ),
        itemBuilder: ((context, snapshot) {
          Map<String, dynamic> data = mapData(snapshot);
          Timestamp tOn = data['usoOn'] as Timestamp;
          DateTime dateOn = tOn.toDate();
          Timestamp tOff = data['usoOff'] as Timestamp;
          DateTime dateOff = tOff.toDate();

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Informacion del EDT',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Expanded(
                      child: ListTile(
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Nombre del EDT: ${data['usoEdtNombre']}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Minutos usados: ${data['usoMinutos']}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Fecha y hora de encendido: ${dateOn.day}/${dateOn.month}/${dateOn.year}  ${dateOn.hour}:${dateOn.minute}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Fecha y hora de apagado: ${dateOff.day}/${dateOff.month}/${dateOff.year}  ${dateOff.hour}:${dateOff.minute}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Grupo: ${data['usoEdtGrupo']}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Unidad Curricular: ${data['usoEdtUC']}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: ((BuildContext context) {
                return Container(
                  height: 400,
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(
                                      title: AxisTitle(text: 'Fecha y hora')),
                                  primaryYAxis: NumericAxis(
                                      title: AxisTitle(text: 'Minutos')),
                                  title: ChartTitle(
                                      text:
                                          'Grafico de Minutos de Uso / Tiempo de Encendido',
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  //legend: Legend(isVisible: true),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <ChartSeries>[
                                    ColumnSeries<StaticData, DateTime>(
                                        dataSource: getColumnData(),
                                        xValueMapper: (StaticData static, _) =>
                                            static.x,
                                        yValueMapper: (StaticData static, _) =>
                                            static.y,
                                        dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                        ))
                                  ]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                child: const Text('Cerrar el grafico'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ]),
                  ),
                );
              }));
        },
        label: const Text('Grafico'),
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.bar_chart),
      ),*/
    );
  }
}

Map<String, dynamic> mapData(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
  Map<String, dynamic> data = snapshot.data();
  return data;
}

/*
getColumnData() async {
  QueryDocumentSnapshot<Map<String, dynamic>> data =
      mapData as QueryDocumentSnapshot<Map<String, dynamic>>;

  Timestamp tOn = data['usoOn'] as Timestamp;
  DateTime dateOn = tOn.toDate();
  List<StaticData> columnData = <StaticData>[
    StaticData(dateOn, data['usoMinutos']),
  ];
  return columnData;
}*/

/*getColumnData() async {
  User? user = FirebaseAuth.instance.currentUser;

  List<String, dynamic> querySnapshot = (await FirebaseFirestore.instance
      .collection('uso')
      //.where('usoEdtEstAsigId', isEqualTo: user!.uid)
      .orderBy('usoOff', descending: true)
      .get()) as List<String, dynamic>;
  final data = await querySnapshot;
  Timestamp tOn = data['usoOn'] as Timestamp;
  DateTime dateOn = tOn.toDate();
  List<StaticData> columnData = <StaticData>[
    StaticData(dateOn, data['usoMinutos']),
  ];
  return columnData;
}*/

class StaticData {
  DateTime x;
  double y;

  StaticData(this.x, this.y);
}

dynamic getColumnData() {
  /*List<StaticData> columnData = <StaticData>[
      StaticData(dateOn, data['usoMinutos'])
    ];
    return columnData;*/
}

/*QueryDocumentSnapshot<Map<String, dynamic>> data =
        mapData as QueryDocumentSnapshot<Map<String, dynamic>>;

    Timestamp tOn = data['usoOn'] as Timestamp;
    DateTime dateOn = tOn.toDate();
    List<StaticData> columnData = <StaticData>[
      StaticData(dateOn, data['usoMinutos']),
    ];
    return columnData;*/




  /*getColumnData() {

    QueryDocumentSnapshot<Map<String, dynamic>> snapshot;
    Map<String, dynamic> data = snapshot.data();
    Timestamp tOn = data['usoOn'] as Timestamp;
    DateTime dateOn = tOn.toDate();
    List<StaticData> columnData = <StaticData>[
      StaticData(dateOn, data['usoMinutos']),
    ];
    return columnData;
  }*/






/*
  Map<String, dynamic> getColumnData(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data();
    Timestamp tOn = data['usoOn'] as Timestamp;
    DateTime dateOn = tOn.toDate();
    List<StaticData> columnData = <StaticData>[
      StaticData(dateOn, data['usoMinutos']),
     
    ];
     print(columnData);
    return data;
    
  }*/

/*
dynamic getColumnData(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data();
    Timestamp tOn = data['usoOn'] as Timestamp;
    DateTime dateOn = tOn.toDate();
    List<StaticData> columnData = <StaticData>[
      StaticData(dateOn, data['usoMinutos'])
    ];
    return columnData;
  }
*/

/*
dynamic getColumnData() async {
  /*Query<Map<String, dynamic>> queryStatic() {
    return FirebaseFirestore.instance
        .collection('uso')
        //.where('usoEdtEstAsigId', isEqualTo: user!.uid)
        .orderBy('usoOn', descending: true);
  }*/
  Query<Map<String, dynamic>> _usoQuery = FirebaseFirestore.instance
      .collection('uso')
      // comentar la linea de abajo para ver la lista de todos los usuarios
      //.where('usoEdtEstAsigId', isEqualTo: user!.uid)
      .orderBy("usoOn", descending: true);

  Map<String, dynamic> data = _usoQuery.data();
  Timestamp tOn = data['usoOn'] as Timestamp;
  DateTime dateOn = tOn.toDate();

  List<StaticData> columnData = <StaticData>[
    StaticData(dateOn, data['usoMinutos'])
  ];
  return columnData;
}
*/

