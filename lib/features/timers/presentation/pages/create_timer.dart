import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/timer.dart';
import '../../domain/repositories/default.dart';
import '../../domain/repositories/projects.dart';
import '../bloc/timer_bloc.dart';
import '../bloc/timer_event.dart';

class CreateTimerScreen extends StatefulWidget {
  const CreateTimerScreen({super.key});

  @override
  State<CreateTimerScreen> createState() => _CreateTimerScreenState();
}

class _CreateTimerScreenState extends State<CreateTimerScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedProject = ProjectsRepository.projects.first.id;
  String _selectedTask = ProjectsRepository.tasks.first.id;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedProject,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProject = newValue!;
                });
              },
              items: ProjectsRepository.projects
                  .map<DropdownMenuItem<String>>(
                    (project) => DropdownMenuItem<String>(
                      value: project.id,
                      child: Text(project.name),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedTask,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTask = newValue!;
                });
              },
              items: ProjectsRepository.tasks
                  .where((task) => task.projectId == _selectedProject)
                  .map<DropdownMenuItem<String>>(
                    (task) => DropdownMenuItem<String>(
                      value: task.id,
                      child: Text(task.name),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: const Text('Favorite'),
              value: _isFavorite,
              onChanged: (bool? value) {
                setState(() {
                  _isFavorite = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String id = (MyRepository.timers.length + 1).toString();
                Timer timer = Timer(
                  id: id,
                  projectId: _selectedProject,
                  taskId: _selectedTask,
                  description: _descriptionController.text,
                  isFavorite: _isFavorite,
                  startTime: 0,
                  stopTime: 0,
                  isRunning: false,
                );
                BlocProvider.of<TimerBloc>(context).add(AddTimer(timer));
                Navigator.pop(context);
              },
              child: const Text('Add Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
