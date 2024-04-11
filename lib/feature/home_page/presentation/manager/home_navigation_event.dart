part of 'home_navigation_bloc.dart';

abstract class HomeNavigationEvent extends Equatable {
  const HomeNavigationEvent();
}

class HomeNavigationScanEvent extends HomeNavigationEvent {
  @override
  List<Object?> get props => [];
}

class HomeNavigationCreateEvent extends HomeNavigationEvent {
  @override
  List<Object?> get props => [];
}