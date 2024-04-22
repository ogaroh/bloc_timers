import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/timer.dart';
import '../../domain/repositories/projects.dart';
import '../bloc/timer_bloc.dart';
import '../bloc/timer_event.dart';
import 'create_timer.dart';

class TimerListScreen extends StatelessWidget {
  const TimerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Timers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateTimerScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TimerBloc, List<Timer>>(
        builder: (context, timers) {
          return ListView.builder(
            itemCount: timers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Timer ${timers[index].id}'),
                subtitle: Text(
                    'Project: ${ProjectsRepository.projects[int.parse(timers[index].projectId) - 1].name}, Task: ${ProjectsRepository.tasks[int.parse(timers[index].taskId) - 1].name}'),
                trailing: IconButton(
                  icon: timers[index].isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                  onPressed: () {
                    if (timers[index].isRunning) {
                      BlocProvider.of<TimerBloc>(context)
                          .add(StopTimer(timers[index]));
                    } else {
                      BlocProvider.of<TimerBloc>(context)
                          .add(StartTimer(timers[index]));
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
