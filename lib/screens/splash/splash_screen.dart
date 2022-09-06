import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 10),
      () => Navigator.pushNamed(context, '/login'),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    'UTEC Gestion de EDTs',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/logo_utec.png',
                  height: 180,
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/logo_bit.png',
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            debugPrint("Listener");
            if (state.status == AuthStatus.unauthenticated) {
              Timer(
                const Duration(seconds: 5),
                () => Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  ModalRoute.withName('/login'),
                ),
              );
            } else if (state.status == AuthStatus.authenticated) {
              Timer(
                const Duration(seconds: 5),
                () => Navigator.of(context).pushNamed(HomeScreen.routeName),
              );
            }
          },
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: const Alignment(0, -1 / 3),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          'UTEC Gestion de EDTs',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Image.asset(
                        'assets/images/logo_utec.png',
                        height: 180,
                      ),
                      const SizedBox(height: 16),
                      Image.asset(
                        'assets/images/logo_bit.png',
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
*/