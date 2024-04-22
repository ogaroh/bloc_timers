import '../../data/models/timer.dart';

class MyRepository {
  static List<Timer> timers = [];

  static void addTimer(Timer timer) {
    timers.add(timer);
  }

  static List<Timer> getTimers() {
    return timers;
  }
}
