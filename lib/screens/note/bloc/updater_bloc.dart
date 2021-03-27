import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'updater_event.dart';
part 'updater_state.dart';
part 'tick.dart';

class UpdaterBloc extends Bloc<UpdaterEvent, UpdaterState> {
  final Ticker _ticker;
  final _client = http.Client();

  late StreamSubscription<bool> _tickerSubscription;

  UpdaterBloc({
    required Ticker ticker,
  })   : _ticker = ticker,
        super(const UpdaterState(
          tick: false,
          status: UpdaterStatus.ready,
          content: '',
          htmlContent: '',
        )) {
    _tickerSubscription =
        _ticker.tick().listen((bool tick) => add(UpdaterTick(tick: tick)));
    add(const UpdaterTick(tick: false));
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }

  @override
  Stream<UpdaterState> mapEventToState(
    UpdaterEvent event,
  ) async* {
    // print('EVENT: ${event.runtimeType}');
    if (event is UpdaterTick) {
      yield* _mapUpdaterTickToState(event);
    } else if (event is UpdaterContent) {
      yield* _mapUpdaterContentToState(event);
    }
  }

  Stream<UpdaterState> _mapUpdaterTickToState(UpdaterTick event) async* {
    if (state.status == UpdaterStatus.ready) {
      yield state.copyWith(tick: event.tick, status: UpdaterStatus.inProgress);
    } else {
      yield state.copyWith(tick: event.tick);
    }
  }

  Stream<UpdaterState> _mapUpdaterContentToState(UpdaterContent event) async* {
    if (state.status == UpdaterStatus.inProgress) {
      final url = Uri.parse('http://localhost:8000/markdown');
      var body = {'content': event.content};
      final response = await _client.post(
        url,
        body: JsonEncoder().convert(body),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        final jsonContent = jsonDecode(response.body) as Map<String, dynamic>;
        yield state.copyWith(
          content: event.content,
          htmlContent: jsonContent['content'] as String,
        );
      }
    }
  }
}
