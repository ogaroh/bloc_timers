
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/timers/domain/repositories/default.dart';
import 'features/timers/presentation/bloc/timer_bloc.dart';
import 'features/timers/presentation/pages/timer_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TimerBloc>(
            create: (BuildContext context) =>
                TimerBloc(MyRepository.getTimers()),
          ),
        ],
        child: const TimerListScreen(),
      ),
    );
  }
}