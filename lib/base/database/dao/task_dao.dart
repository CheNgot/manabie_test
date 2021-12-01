// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:manabie_interview/base/database/entity/task.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> listAllTask();

  @Query('SELECT * FROM Task WHERE isComplete = : true')
  Stream<Task?> findTaskComplete();

  @Query('SELECT * FROM Task WHERE isComplete = : false')
  Stream<Task?> findTaskIncomplete();

  @insert
  Future<void> insertPerson(Task task);
  @delete
  Future<void> deleteTask(Task task);
}