class EvenNumberFilter {
  List<int> getEvenNumbers(List<int> inputList) {
    List<int> evenNumbers = [];

    for (int number in inputList) {
      if (isEven(number)) {
        evenNumbers.add(number);
      }
    }

    return evenNumbers;
  }

  bool isEven(int number) {
    return number % 2 == 0;
  }
}