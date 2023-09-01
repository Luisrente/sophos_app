import 'package:flutter_test/flutter_test.dart';
import 'package:sophos_app/src/domain/usescases/usescases.dart';

void main() {
  group('NumberUseCase', () {
    test('parseInput should correctly parse input string', () {
      final input = '1, 2, 3, 4';
      final result = EvenNumberUseCase.parseInput(input);
      expect(result, [1, 2, 3, 4]);
    });

    test('filterEvenNumbers should correctly filter even numbers', () {
      final numbers = [1, 2, 3, 4, 5, 6];
      final result = EvenNumberUseCase.filterEvenNumbers(numbers);
      expect(result, [2, 4, 6]);
    });
  });
}
