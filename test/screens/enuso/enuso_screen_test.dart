import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pfltibit/blocs/enuso/enuso_bloc.dart';
import 'package:pfltibit/repositories/local_storage/local_storage_repository.dart';
import 'package:pfltibit/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  GrillaEnUso page = const GrillaEnUso();

  group('En Uso Screen', () {
    setUp(() async {
      await Hive.initFlutter();
    });

    Widget makeTestableWidget({required Widget child}) {
      return MaterialApp(home: child);
    }

    testWidgets('enuso screen sin edts en uso...', (tester) async {
      await tester.pumpWidget(BlocProvider(
          create: (_) => EnUsoBloc(
                localStorageRepository: LocalStorageRepository(),
              )..add(StartEnUso()),
          child: makeTestableWidget(child: page)));
      expect(find.byKey(const Key('CircularProgressIndicator')), findsWidgets);
    });
  });
}
