import '../mock_data.dart';
import '../models/task.dart';

class TaskRepository {
  Future<List<TaskModel>> getTasks() async {
    await Future.delayed(const Duration(seconds: 2));

    return (data['tasks'] as List)
        .map(
          (task) => TaskModel(
        id: task['id'],
        icon: task['icon'],
        title: task['title'],
        priority: task['priority'],
        note: task['note'],
        startDate: task['start_date'],
        dueDate: task['due_date'],
        isChecked: task['is_checked'],
        iconColor: task['icon_color'],

      ),
    )
        .toList();
  }
}
