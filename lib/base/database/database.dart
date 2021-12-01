import 'dart:async';

import 'package:floor/floor.dart';
import 'package:manabie_interview/base/database/dao/task_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


import 'entity/task.dart';
part 'database.g.dart'; // the generated code will be there



@Database(version: 1, entities: [Task])
abstract class AppDb extends FloorDatabase {
  TaskDao get taskDao;

  static Future<AppDb> init() async {
    AppDb instance = await $FloorAppDb.databaseBuilder("db_test").build();
    return instance;
  }
}