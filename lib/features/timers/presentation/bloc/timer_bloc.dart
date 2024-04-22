import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/timer.dart';
import 'timer_event.dart';

class TimerBloc extends Bloc<TimerEvent, List<Timer>> {
  TimerBloc(super.initialState);

  // @override
  Stream<List<Timer>> mapEventToState(TimerEvent event) async* {
    if (event is LoadTimers) {
      yield state;
    } else if (event is AddTimer) {
      yield [...state, event.timer];
    } else if (event is StartTimer) {
      yield state.map((timer) {
        if (timer.id == event.timer.id) {
          return timer.copyWith(isRunning: true);
        } else {
          return timer;
        }
      }).toList();
    } else if (event is StopTimer) {
      yield state.map((timer) {
        if (timer.id == event.timer.id) {
          return timer.copyWith(
              isRunning: false,
              stopTime: DateTime.now().millisecondsSinceEpoch);
        } else {
          return timer;
        }
      }).toList();
    }
  }
}
