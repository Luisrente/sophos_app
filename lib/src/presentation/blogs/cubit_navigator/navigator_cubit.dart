// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorState2> {
  NavigatorCubit() : super(NavigatorState2(currentPage: 0));

  void updatePage(int value) {
    emit(state.copyWith(
      currentPage: value,
    ));
  }
}
