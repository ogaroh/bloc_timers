import 'package:apexive_assignment/features/timers/presentation/bloc/timer_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register the state management BLoCs
  sl.registerFactory<TimerBloc>(() => TimerBloc(sl()));
}
