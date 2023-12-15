import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/data/loading_status.dart';
import '../../../data/models/task.dart';
import '../../../data/repository/tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _repository;
  TaskBloc({
    required TaskRepository repository,
  })  : _repository = repository,
        super(
        TaskState(
          status: LoadingStatus.pure,
          upcomingTasks: [],
          allTasks: [],
        ),
      ) {
    on<LoadTasks>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        final taskList = await _repository.getTasks();
        emit(
          state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            allTasks: taskList,
            upcomingTasks:
            taskList.where((element) => !element.isChecked).toList(),
          ),
        );
      } catch (e) {
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });

    on<ToggleTaskCheckedValue>((event, emit) {
      var newList = <TaskModel>[];

      for (var i = 0; i < state.allTasks.length; i++) {
        if (state.allTasks[i].id == event.id) {
          newList.add(state.allTasks[i]
              .copyWith(isChecked: !state.allTasks[i].isChecked));
        } else {
          newList.add(state.allTasks[i]);
        }
      }

      emit(state.copyWith(
        allTasks: newList,
        upcomingTasks: newList.where((element) => !element.isChecked).toList(),
      ));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
