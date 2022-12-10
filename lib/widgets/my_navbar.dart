import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import '/models/models.dart';
import 'package:cloud_functions/cloud_functions.dart';

class MyNavBar extends StatelessWidget {
  final String screen;
  final Edt? edt;

  const MyNavBar({
    Key? key,
    required this.screen,
    this.edt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: (screen == '/edt')
            ? AddToEnUsoNavBar(edt: edt!)
            : const HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          tooltip: 'Pantalla principal / Volver',
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        IconButton(
          tooltip: 'Estadisticas de uso',
          icon: const Icon(Icons.bar_chart, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/uso');
          },
        ),
      ],
    );
  }
}

class AddToEnUsoNavBar extends StatelessWidget {
  const AddToEnUsoNavBar({
    Key? key,
    required this.edt,
  }) : super(key: key);

  final Edt edt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.power_settings_new, color: Colors.white),
          onPressed: () {
            startEDT(context, edt.edtNombre);
          },
        ),
        IconButton(
          icon: const Icon(Icons.power_off, color: Colors.white),
          onPressed: () {
            stopEDT(context, edt.edtNombre);
          },
        ),
        BlocBuilder<EnUsoBloc, EnUsoState>(
          builder: (context, state) {
            if (state is EnUsoLoading) {
              return const CircularProgressIndicator();
            }
            if (state is EnUsoLoaded) {
              return IconButton(
                icon: const Icon(Icons.handyman, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Agregado a tu lista de En Uso'),
                    ),
                  );
                  context.read<EnUsoBloc>().add(AddEdtToEnUso(edt));
                },
              );
            }
            return Flexible(
                child: const Text(
              'Algo salio mal, si el problema persiste ponte en contacto con el soporte tecnico',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ));
          },
        ),
      ],
    );
  }

  Future<void> stopEDT(BuildContext context, String edtNombre) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Flexible(
            child: Text(
                'EDT OFF! Se congela el tiempo de consumo hasta que Ud encienda nuevamente el EDT.'),
          ),
        ),
      );
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('stopEDT');
      final resp = await callable
          .call(<String, dynamic>{'instanceName': edtNombre.toLowerCase()});
      debugPrint("result: ${resp.data}");
    } on FirebaseFunctionsException catch (error) {
      debugPrint(error.code);
      debugPrint(error.details);
      debugPrint(error.message);
    }
  }

  Future<void> startEDT(BuildContext context, String edtNombre) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Flexible(
            child: Text(
                'EDT ON! Se descuenta tiempo de consumo hasta que Ud lo Detenga o se Agote el saldo.'),
          ),
        ),
      );
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('startEDT');
      final resp = await callable
          .call(<String, dynamic>{'instanceName': edtNombre.toLowerCase()});
      debugPrint("result: ${resp.data}");
    } on FirebaseFunctionsException catch (error) {
      debugPrint(error.code);
      debugPrint(error.details);
      debugPrint(error.message);
    }
  }
}
