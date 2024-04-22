import '../../data/models/timer.dart';

abstract class TimerEvent {}

class LoadTimers extends TimerEvent {}

class AddTimer extends TimerEvent {
  final Timer timer;

  AddTimer(this.timer);
}

class StartTimer extends TimerEvent {
  final Timer timer;

  StartTimer(this.timer);
}

class StopTimer extends TimerEvent {
  final Timer timer;

  StopTimer(this.timer);
}