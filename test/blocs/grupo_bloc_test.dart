import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pfltibit/repositories/repositories.dart';
import 'package:pfltibit/blocs/blocs.dart';

class MockGrupoRepository extends Mock implements GrupoRepository {}

class MockGrupoBloc extends Mock implements GrupoBloc {}

void main() {
  group('GrupoBloc', () {});

  late GrupoRepository grupoRepository;
  late GrupoBloc grupoBloc;

  setUp(() {
    grupoRepository = MockGrupoRepository();
    grupoBloc = GrupoBloc(grupoRepository: grupoRepository);
  });

  test('initial state is GrupoLoading', () {
    expect(grupoBloc.state, GrupoLoading() );
  });
}