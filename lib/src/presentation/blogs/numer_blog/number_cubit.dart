import 'package:bloc/bloc.dart';
import 'package:sophos_app/src/domain/usescases/usescases.dart';
import 'package:sophos_app/src/presentation/blogs/numer_blog/number_state.dart';



class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(NumberInitial());

  void filterNumbers(String input) {
    try {
      final numbers = EvenNumberUseCase.parseInput(input);
      final evenNumbers = EvenNumberUseCase.filterEvenNumbers(numbers);
      emit(NumberLoaded(evenNumbers));
    } catch (e) {
      emit(NumberError(e.toString()));
    }
  }
}