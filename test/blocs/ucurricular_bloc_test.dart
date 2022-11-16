import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pfltibit/repositories/repositories.dart';
import 'package:pfltibit/blocs/blocs.dart';

class MockUCurricularRepository extends Mock implements UCurricularRepository {}

class MockUCurricularBloc extends Mock implements UCurricularBloc {}

void main() {
  group('UCurricularBloc', () {});

  late UCurricularRepository ucurricularRepository;
  late UCurricularBloc ucurricularBloc;

  setUp(() {
    ucurricularRepository = MockUCurricularRepository();
    ucurricularBloc = UCurricularBloc(ucurricularRepository: ucurricularRepository);
  });

  test('initial state is UCurricularLoading', () {
    expect(ucurricularBloc.state, UCurricularLoading() );
  });
}
