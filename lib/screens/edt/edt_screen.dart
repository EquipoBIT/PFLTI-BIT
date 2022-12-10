import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class EdtScreen extends StatelessWidget {
  static const String routeName = '/edt';

  static Route route({required Edt edt}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => EdtScreen(edt: edt),
    );
  }

  final Edt edt;

  const EdtScreen({
    super.key,
    required this.edt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: edt.edtNombre),
      bottomNavigationBar: MyNavBar(
        screen: routeName,
        edt: edt,
      ),
      body: EdtInfo(edt: edt),
    );
  }
}

User? user = FirebaseAuth.instance.currentUser;

class EdtInfo extends StatelessWidget {
  const EdtInfo({
    Key? key,
    required this.edt,
  }) : super(key: key);

  final Edt edt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              height: 300,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [InfoCarouselCard(edt: edt)],
          ),
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
                            Tooltip(
                              message: 'Nombre del Entorno de Trabajo',
                              child: Text(
                                edt.edtNombre,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Tooltip(
                              message: 'Saldo de tiempo restante en este EDT',
                              child: Text(
                                'Saldo: ${edt.edtSaldoTiempo}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
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
                    'Detalle del EDT',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Tooltip(
                        message:
                            'Unidad Curricular a la cual pertenece este EDT',
                        child: Text(
                          'Unidad Curricular: ${edt.edtUCurricular}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Tooltip(
                        message: 'Grupo al cual pertenece este EDT',
                        child: Text(
                          'Grupo: ${edt.edtGrupo}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Tooltip(
                        message: 'Referente a cargo de este EDT',
                        child: Text(
                          'Referente: ${edt.edtReferenteNombre}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Tooltip(
                        message: 'Imagen base usada en la creacion de este EDT',
                        child: Text(
                          'ImgBase: ${edt.edtImgBase}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Tooltip(
                        message:
                            'ITR al cual pertenece el UC / Grupo / Estudiante',
                        child: Text(
                          'ITR: ${edt.edtItr}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Actividad",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Tooltip(
                        message: 'Saldo de tiempo restante en este EDT',
                        child: Text(
                          'Saldo de tiempo: ${edt.edtSaldoTiempo}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    ListTile(
                      title: edt.edtActivo == true
                          ? Tooltip(
                              message:
                                  'Indica si el EDT esta activo o inactivo',
                              child: Text(
                                'EDT Activo?: El EDT esta activo',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            )
                          : Tooltip(
                              message:
                                  'Indica si el EDT esta activo o inactivo',
                              child: Text(
                                'EDT Activo?: El EDT esta inactivo',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Estudiante Asignado",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: edt.edtEstAsigId == user!.uid
                          ? Tooltip(
                              message:
                                  'Nombre del usuario al cual pertenece este EDT',
                              child: Text(
                                'Usuario: ${user?.displayName}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            )
                          : Tooltip(
                              message:
                                  'ID del usuario al cual pertenece este EDT',
                              child: Text(
                                'ID: ${edt.edtEstAsigId}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                    )
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    'Infraestructura',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Tooltip(
                        message: 'Proyecto al cual pertenece este EDT',
                        child: Text(
                          'Proyecto: ${edt.edtProjectId}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Tooltip(
                        message: 'Zona a la cual pertenece este EDT',
                        child: Text(
                          'Zona: ${edt.edtZone}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
