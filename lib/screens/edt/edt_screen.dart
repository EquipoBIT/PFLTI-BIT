import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class EdtScreen extends StatelessWidget {
  static const String routeName = '/edt';

  static Route route({required Edt edt}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => EdtScreen(edt: edt),
    );
  }

  final Edt edt;

  const EdtScreen({
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
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
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
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              edt.edtNombre,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'Saldo de tiempo: ${edt.edtSaldoTiempo}',
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
                    'Detalle del EDT',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Unidad Curricular: ${edt.edtUCurricular}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Grupo: ${edt.edtGrupo}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Referente: ${edt.edtReferenteNombre}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'ImgBase: ${edt.edtImgBase}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'ITR: ${edt.edtItr}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Actividad",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Saldo de timepo: ${edt.edtSaldoTiempo}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'EDT Activo?: ${edt.edtActivo}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Estudiante Asignado",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'IDs: ${edt.edtEstAsigId}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
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
