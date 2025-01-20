part of 'home_navigation_bloc.dart';

abstract class HomeNavigationState extends Equatable {
  final int index;

  const HomeNavigationState({required this.index});
}

class HomeNavigationInitialState extends HomeNavigationState {
  const HomeNavigationInitialState({required super.index});

  @override
  List<Object> get props => [index];
}

class HomeNavigationSelectPageState extends HomeNavigationState {
  const HomeNavigationSelectPageState({required super.index});

  @override
  List<Object> get props => [index];
}
