part of 'updater_bloc.dart';

abstract class UpdaterEvent extends Equatable {
  const UpdaterEvent();

  @override
  List<Object> get props => [];
}

class UpdaterTick extends UpdaterEvent {
  // To recognize new tick, second holds how many update request happens.
  final bool tick;

  const UpdaterTick({required this.tick});

  @override
  List<Object> get props => [tick];
}

class UpdaterContent extends UpdaterEvent {
  final String content;

  const UpdaterContent({required this.content});

  @override
  List<Object> get props => [content];
}
