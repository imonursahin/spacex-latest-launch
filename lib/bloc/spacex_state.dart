part of 'spacex_bloc.dart';

abstract class SpacexState {}

class SpacexLoading extends SpacexState {}

class SpacexError extends SpacexState {
  final String message;
  SpacexError(this.message);
}

class SpacexLoaded extends SpacexState {
  final SpacexModel model;
  SpacexLoaded(this.model);
}
