import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/loading_status.dart';
import '../../../domain/entities/task.dart';


part 'tasks_state.dart';
part 'tasks_event.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(
          const TasksState(
            status: LoadingStatus.pure,
            tasks: [],
          ),
        ) {
    on<GetTasksEvent>((event, emit) {});
  }
}
