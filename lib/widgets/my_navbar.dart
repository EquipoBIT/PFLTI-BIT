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
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
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
                      content: Text('Added to your EnUsoList!'),
                    ),
                  );
                  context.read<EnUsoBloc>().add(AddEdtToEnUso(edt));
                },
              );
            }
            return const Text('Something went wrong!');
          },
        ),
      ],
    );
  }

// https://firebase.flutter.dev/docs/functions/usage/

  Future<void> stopEDT(BuildContext context, String edtNombre) async {
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable('stopEDT2')
          .call(<String, dynamic>{'instanceName': edtNombre});
 
// ¡¡¡¡¡¡¡¡¡¡¡¡¡
// OJO HAY QUE SACAR ESTE MSG para el screen y no ponerlo en el metodo async!!!

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'EDT OFF! Se congela el tiempo de consumo hasta que Ud encienda nuevamente el EDT.'),
        ),
      );
      debugPrint("result: ${result.data}");
    } on FirebaseFunctionsException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'ERROR EN EDT OFF!!!!'),
        ),
      );
      debugPrint(error.code);
      debugPrint(error.details);
      debugPrint(error.message);
    }
  }

  Future<void> startEDT(BuildContext context, String edtNombre) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'EDT ON! Se descuenta tiempo de consumo hasta que Ud lo Detenga o se Agote el saldo.'),
        ),
      );
      final result = await FirebaseFunctions.instance
          .httpsCallable('startEDT2')
          .call(<String, dynamic>{'instanceName': edtNombre});
      debugPrint("result: ${result.data}");
    } on FirebaseFunctionsException catch (error) {
      debugPrint(error.code);
      debugPrint(error.details);
      debugPrint(error.message);
    }
  }
}
