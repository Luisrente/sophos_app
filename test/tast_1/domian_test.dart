import 'package:test/test.dart';
import 'domain.dart';

void main() {
  test('Get even numbers from a list', () {
    EvenNumberFilter evenNumberFilter = EvenNumberFilter();
    List<int> inputList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    List<int> evenNumbers = evenNumberFilter.getEvenNumbers(inputList);

    expect(evenNumbers, [2, 4, 6, 8, 10]);
  });

  test('Check if a number is even', () {
    EvenNumberFilter evenNumberFilter = EvenNumberFilter();

    expect(evenNumberFilter.isEven(4), true);
    expect(evenNumberFilter.isEven(7), false);
  });
}
