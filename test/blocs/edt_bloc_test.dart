import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pfltibit/repositories/repositories.dart';
import 'package:pfltibit/blocs/blocs.dart';

class MockEdtRepository extends Mock implements EdtRepository {}

class MockEdtBloc extends Mock implements EdtBloc {}

void main() {
  group('EdtBloc', () {});

  late EdtRepository edtRepository;
  late EdtBloc edtBloc;

  setUp(() {
    edtRepository = MockEdtRepository();
    edtBloc = EdtBloc(edtRepository: edtRepository);
  });

  test('initial state is EdtLoading', () {
    expect(edtBloc.state, EdtLoading() );
  });
}
