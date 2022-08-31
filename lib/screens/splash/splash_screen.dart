import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print("Listener");
            if (state.status == AuthStatus.unauthenticated) {
              Timer(
                Duration(seconds: 5),
                () => Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  ModalRoute.withName('/login'),
                ),
              );
            } else if (state.status == AuthStatus.authenticated) {
              Timer(
                Duration(seconds: 5),
                () => Navigator.of(context).pushNamed(HomeScreen.routeName),
              );
            }
          },

/*        
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/images/logo_bit.png'),
                  width: 125,
                  height: 125,
                ),
              ),
              SizedBox(height: 30),
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
              )
            ],
          ),
        ),
*/
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
