part of 'updater_bloc.dart';

enum UpdaterStatus { ready, inProgress }

class UpdaterState extends Equatable {
  final bool tick;
  final UpdaterStatus status;
  final String content;
  final String htmlContent;

  const UpdaterState({
    required this.tick,
    required this.status,
    required this.content,
    required this.htmlContent,
  });

  @override
  List<Object> get props => [tick, status, content];

  UpdaterState copyWith({
    bool? tick,
    UpdaterStatus? status,
    String? content,
    String? htmlContent,
  }) {
    return UpdaterState(
      tick: tick ?? this.tick,
      status: status ?? this.status,
      content: content ?? this.content,
      htmlContent: htmlContent ?? this.htmlContent,
    );
  }
}
