import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import '/models/models.dart';

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
        child: (screen == '/edt') ? AddToEnUsoNavBar(edt: edt!) : HomeNavBar(),
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
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        IconButton(
          icon: Icon(Icons.person, color: Colors.white),
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
          icon: Icon(Icons.power_settings_new, color: Colors.white),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'EDT ON! Se descuenta tiempo de consumo hasta que Ud lo Detenga o se Agote el saldo.'),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.power_off, color: Colors.white),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'EDT OFF! Se congela el tiempo de consumo hasta que Ud encienda nuevamente el EDT.'),
              ),
            );
          },
        ),
        BlocBuilder<EnUsoBloc, EnUsoState>(
          builder: (context, state) {
            if (state is EnUsoLoading) {
              return CircularProgressIndicator();
            }
            if (state is EnUsoLoaded) {
              return IconButton(
                icon: Icon(Icons.handyman, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to your EnUsoList!'),
                    ),
                  );
                  context.read<EnUsoBloc>().add(AddEdtToEnUso(edt));
                },
              );
            }
            return Text('Something went wrong!');
          },
        ),
      ],
    );
  }
}
