import 'domain.dart';

void main() {
  List<int> inputList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  EvenNumberFilter evenNumberFilter = EvenNumberFilter();
  List<int> evenNumbers = evenNumberFilter.getEvenNumbers(inputList);

  print("Input List: $inputList");
  print("Even Numbers: $evenNumbers");
}
