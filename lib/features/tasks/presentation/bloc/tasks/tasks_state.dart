part of 'tasks_bloc.dart';


class TaskState {
  final LoadingStatus status;
  final List<TaskModel> upcomingTasks;
  final List<TaskModel> allTasks;

  TaskState({
    required this.status,
    required this.allTasks,
    required this.upcomingTasks,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskState &&
        other.status == status &&
        listEquals(other.allTasks, allTasks) &&
        listEquals(other.upcomingTasks, upcomingTasks);
  }

  @override
  int get hashCode =>
      status.hashCode ^ upcomingTasks.hashCode ^ allTasks.hashCode;

  TaskState copyWith({
    LoadingStatus? status,
    List<TaskModel>? upcomingTasks,
    List<TaskModel>? allTasks,
  }) {
    return TaskState(
      status: status ?? this.status,
      upcomingTasks: upcomingTasks ?? this.upcomingTasks,
      allTasks: allTasks ?? this.allTasks,
    );
  }
}