import 'package:flutter_test/flutter_test.dart';
import 'package:web_app/views/home/home_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main(List<String> args) {
  group('HomeViewModelTest', () {
    group('initialize -', () {
      test('when called should fetch photos from api (image has value)', () async {
        var model = HomeViewModel();
        await model.initialRun();
        verify(model.initialRun()).called(1);
        expect(await model.initialRun(), isA<List<String>>());
        
      });
    });
  });
}