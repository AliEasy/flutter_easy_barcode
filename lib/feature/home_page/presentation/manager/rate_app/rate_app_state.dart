part of 'rate_app_bloc.dart';

sealed class RateAppState {}

final class RateAppInitialState extends RateAppState {}

final class RateAppNotHappenedState extends RateAppState {}
