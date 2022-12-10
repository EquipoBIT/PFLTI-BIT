import 'dart:async';

import 'package:pfltibit/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '../screens.dart';
import '/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          authBloc: BlocProvider.of<AuthBloc>(context),
          userRepository: context.read<UserRepository>(),
        )..add(
            LoadProfile(context.read<AuthBloc>().state.authUser),
          ),
        child: const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 1),
              () => Navigator.of(context).pushNamed(LoginScreen.routeName),
            );
          }
        },
        child: Scaffold(
          appBar: const MyAppBar(title: 'Perfil del usuario'),
          bottomNavigationBar: const MyNavBar(screen: routeName),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              if (state is ProfileLoaded) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Informacion de Usuario',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              state.user.uUrlFoto,
                              scale: 0.8,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        Flexible(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  'Nombre: ${state.user.uNombreCompleto}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Correo: ${state.user.uCorreo}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Perfil del usuario: ${state.user.uPerfil}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthRepository>().signOut();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: Colors.black,
                          fixedSize: const Size(200, 40),
                        ),
                        child: Text(
                          'Cerrar sesión',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (state is ProfileUnauthenticated) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'No estas logueado',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.black,
                        fixedSize: const Size(200, 40),
                      ),
                      child: Text(
                        'Iniciar sesión',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                );
              } else {
                return Flexible(
                    child: Text(
                  'Algo salio mal, si el problema persiste ponte en contacto con el soporte tecnico',
                  style: Theme.of(context).textTheme.headline5,
                ));
              }
            },
          ),
        ));
  }
}
