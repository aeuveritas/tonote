part of 'updater_bloc.dart';

class Ticker {
  Stream<bool> tick() {
    return Stream.periodic(const Duration(seconds: 1), (int x) => x.isEven);
  }
}
