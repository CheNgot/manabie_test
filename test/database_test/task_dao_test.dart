import 'package:floor/floor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_interview/base/database/dao/task_dao.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:matcher/matcher.dart';
import 'package:sqflite/sqflite.dart';



void main() {
  group('database tests', () {
    late AppDb appDb;
    late TaskDao taskDao;

    setUp(() async {
      final migration1to2 = Migration(1, 2, (database) async {
        await database.execute('ALTER TABLE task ADD COLUMN isComplete TEXT');
      });
      final allMigrations = [migration1to2];

      appDb = await $FloorAppDb
          .inMemoryDatabaseBuilder()
          .addMigrations(allMigrations)
          .build();

      taskDao = appDb.taskDao;
    });

    tearDown(() async {
      await appDb.close();
    });

    test('database initially is empty', () async {
      final actual = await taskDao.listAllTask();

      expect(actual, isEmpty);
    });

    group('change single item', () {
      test('insert task', () async {
        final task = Task(name: "test",content: "test132",isComplete: false);
        await taskDao.insertTask(task);

        final actual = await taskDao.listAllTask();

        expect(actual, hasLength(1));
      });

      test('delete task', () async {
        final task = Task(name: "test",content: "test132",isComplete: false);
        // await taskDao.insertTask(task);

        await taskDao.deleteTask(task);

        final actual = await taskDao.listAllTask();
        expect(actual, isEmpty);
      });

      test('update person', () async {
        final task = Task(id: 3,name: "test12356",content: "check check",isComplete: false);
        await taskDao.insertTask(task);
        final updatedTask = Task(id:3, name: "test12356",content: "check check",isComplete: false);

        await taskDao.updateTask(updatedTask);

        final actual = await taskDao.findTask(3);

        expect(actual, equals(updatedTask));
      });
    });
  });
  // test('callback test', () async {
  //   final database = await $FloorAppDb
  //       .inMemoryDatabaseBuilder()
  //       .addCallback(Callback(
  //     onConfigure: (database) =>
  //         database.execute('PRAGMA foreign_keys = OFF'),
  //     onCreate: (database, version) async {
  //       //insert element with missing person (should not fail since foreign key checks are off)
  //       await database.execute(
  //           "INSERT INTO dog (id,name,nick_name,owner_id) VALUES (1,'doggo','d',4);");
  //     },
  //     onOpen: (database) => database.execute('PRAGMA foreign_keys = ON'),
  //   ))
  //       .build();
  //   await database.close();
  // });
}

final _throwsDatabaseException =
throwsA(const TypeMatcher<DatabaseException>());