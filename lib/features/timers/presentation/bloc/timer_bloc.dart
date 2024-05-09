import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/timer.dart';
import '../../domain/repositories/default.dart';
import 'timer_event.dart';

class TimerBloc extends Bloc<TimerEvent, List<Timer>> {
  TimerBloc(super.initialState) : super() {
    on<AddTimer>(onAddTimer);
    on<StartTimer>(onStartTimer);
    on<StopTimer>(onStopTimer);
  }

  // on add timer
  onAddTimer(AddTimer event, emit) async {
    log("Add timer clicked: ${event.timer.toString()}");
    DefaultRepository.addTimer(event.timer);
    log("${DefaultRepository.getTimers().length}");
  }

  // on start timer
  onStartTimer(StartTimer event, emit) async {
    log("Start timer clicked: ${event.timer.toString()}");
  }

  // on start timer
  onStopTimer(StopTimer event, emit) async {
    log("Stop timer clicked: ${event.timer.toString()}");
  }

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
