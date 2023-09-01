class EvenNumberUseCase {
  static List<int> parseInput(String input) {
    final numberStrings = input.split(',');
    return numberStrings.map((string) => int.tryParse(string.trim()) ?? 0).toList();
  }

  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((number) => number % 2 == 0).toList();
  }
}
