import 'package:flutter_test/flutter_test.dart';
import 'package:pfltibit/models/edt_model.dart';
import 'package:pfltibit/repositories/edt/edt_repository.dart';
import 'package:pfltibit/screens/screens.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pfltibit/repositories/repositories.dart';

class MockEdt extends Mock implements Edt {}

class MockEdtRepository extends Mock implements EdtRepository {}

void main() {
  group('EDT Screen', () {
    late MockEdtRepository edtRepository;
    late MockEdt edt;

    setUp(() {
      edtRepository = MockEdtRepository();
      edt = edtRepository.getAllEdts().first as MockEdt;
    });

    testWidgets('edt screen ...', (tester) async {
      await tester.pumpWidget(EdtScreen(edt: edt));
      expect(find.text('UTEC Gestion de EDTs'), findsOneWidget);
    });
  });
}
