part of 'tasks_bloc.dart';

sealed class TaskEvent {
  const TaskEvent();
}

class LoadTasks extends TaskEvent {}

class ToggleTaskCheckedValue extends TaskEvent {
  final int id;

  ToggleTaskCheckedValue({required this.id});
}