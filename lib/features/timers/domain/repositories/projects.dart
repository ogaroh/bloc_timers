import '../../data/models/project.dart';
import '../../data/models/task.dart';
import '../../data/sources/projects.dart';
import '../../data/sources/tasks.dart';

class ProjectsRepository {
  static List<Project> projects = kProjects;

  static List<Task> tasks = kTasks;
}
