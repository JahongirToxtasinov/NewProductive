import '../../../../core/exceptions/cache.dart';
import '../../../../core/exceptions/server.dart';
import '../../domain/entities/task.dart';
import '../../domain/repository/tasks.dart';
import '../data_source/local_data_source/tasks.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksLocalDataSource _tasksLocalDataSource;

  TasksRepositoryImpl({required TasksLocalDataSource dataSource})
      : _tasksLocalDataSource = dataSource;

  @override
  Future<List<TaskEntity>> getTasks() async {
    try {
      final tasksList = await _tasksLocalDataSource.getTasks();
      return tasksList;
    } on CacheException catch (error) {
      return [];
    } on ServerException catch (error) {
      return [];
    }
  }
}
