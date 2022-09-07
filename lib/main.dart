import 'package:pfltibit/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/config/theme.dart';
import '/config/app_router.dart';
import '/blocs/blocs.dart';
import '/repositories/repositories.dart';
import '/screens/screens.dart';
import '/simple_bloc_observer.dart';
import '/models/models.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(EdtAdapter());
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'UTEC Gestion EDTs',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(
              userRepository: context.read<UserRepository>(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>(),
              ),
            ),
            BlocProvider(
              create: (_) => EnUsoBloc(
                localStorageRepository: LocalStorageRepository(),
              )..add(StartEnUso()),
            ),
            BlocProvider(
              create: (_) => UCurricularBloc(
                ucurricularRepository: UCurricularRepository(),
              )..add(
                  LoadUCurriculares(),
                ),
            ),
            BlocProvider(
              create: (_) => EdtBloc(
                edtRepository: EdtRepository(),
              )..add(LoadEdts()),
            ),
            BlocProvider(
              create: (_) => GrupoBloc(
                grupoRepository: GrupoRepository(),
              )..add(LoadGrupos()),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'Gestion de EDTs',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: LoginScreen.routeName,
          ),
        ),
      ),
    );
  }
}
