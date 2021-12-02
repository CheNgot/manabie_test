
import 'package:floor/floor.dart';
import 'package:manabie_interview/base/database/entity/task.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> listAllTask();

  @Query('SELECT * FROM Task WHERE isComplete = true')
  Future<List<Task>> findTasksComplete();

  @Query('SELECT * FROM Task WHERE isComplete = false')
  Future<List<Task>> findTasksIncomplete();

  @insert
  Future<void> insertPerson(Task task);

  @delete
  Future<void> deleteTask(Task task);

  @update
  Future<void> updateTask(Task task);
}
