import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sophos_app/src/presentation/blogs/blogs.dart';
import 'package:sophos_app/src/presentation/blogs/numer_blog/number_state.dart';

void main() {
  group('NumberCubit', () {
    blocTest<NumberCubit, NumberState>(
      'emits [NumberLoaded] when filterNumbers is called with valid input',
      build: () => NumberCubit(),
      act: (cubit) => cubit.filterNumbers('1, 2, 3, 4'),
      expect: () => [NumberLoaded([2, 4])],
    );

  });
}
