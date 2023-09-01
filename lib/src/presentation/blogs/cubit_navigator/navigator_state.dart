part of 'navigator_cubit.dart';

class NavigatorState2 {
  final int currentPage;

  const NavigatorState2({this.currentPage = 0});

  copyWith({
    int? currentPage,
    PageController? pageController,
  }) =>
      NavigatorState2(
        currentPage: currentPage ?? this.currentPage,
      );
}
