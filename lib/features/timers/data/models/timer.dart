class Timer {
  final String id;
  final String projectId;
  final String taskId;
  final String description;
  final bool isFavorite;
  final int startTime;
  final int stopTime;
  final bool isRunning;

  Timer({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.description,
    required this.isFavorite,
    required this.startTime,
    required this.stopTime,
    required this.isRunning,
  });

  Timer copyWith({
    String? id,
    String? projectId,
    String? taskId,
    String? description,
    bool? isFavorite,
    int? startTime,
    int? stopTime,
    bool? isRunning,
  }) {
    return Timer(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      taskId: taskId ?? this.taskId,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      startTime: startTime ?? this.startTime,
      stopTime: stopTime ?? this.stopTime,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
