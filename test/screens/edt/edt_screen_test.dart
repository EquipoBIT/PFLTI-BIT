import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pfltibit/models/edt_model.dart';
import 'package:pfltibit/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  group('EDT Screen', () {
    setUp(() {});

    Widget makeTestableWidget({required Widget child}) {
      return MaterialApp(home: child);
    }

    testWidgets('edt screen ...', (tester) async {
      Edt edt = const Edt(
        edtId: '3EaB76U1JJgmE8gm7MNM',
        edtNombre: 'EDT001',
        edtUrlImagen:
            'https://c.pxhere.com/photos/32/7b/media_social_media_apps_social_network_facebook_symbols_digital_twitter-1063277.jpg!d',
        edtEstAsigId: 'Cp4OGRx78ieaCLJA5g3Qu3y49zC2',
        edtGrupo: 'Redes Sociales G1',
        edtImgBase: 'Img Base Edt 1',
        edtUCurricular: 'UC Infraestructura',
        edtItr: 'ITR CS',
        edtActivo: true,
        edtReferenteNombre: 'Gabriel',
        edtSaldoTiempo: 20,
      );

      EdtInfo page = EdtInfo(edt: edt);
      await mockNetworkImagesFor(
          () => tester.pumpWidget(makeTestableWidget(child: page)));
      expect(find.text('Detalle del EDT'), findsOneWidget);
      expect(find.text('Actividad'), findsOneWidget);
      expect(find.text('Estudiante Asignado'), findsOneWidget);
    });
  });
}
