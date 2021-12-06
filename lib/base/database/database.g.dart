// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder databaseBuilder(String name) => _$AppDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder inMemoryDatabaseBuilder() => _$AppDbBuilder(null);
}

class _$AppDbBuilder {
  _$AppDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDb extends AppDb {
  _$AppDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `isComplete` INTEGER, `content` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Task',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isComplete': item.isComplete == null
                      ? null
                      : (item.isComplete! ? 1 : 0),
                  'content': item.content
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'Task',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isComplete': item.isComplete == null
                      ? null
                      : (item.isComplete! ? 1 : 0),
                  'content': item.content
                }),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'Task',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isComplete': item.isComplete == null
                      ? null
                      : (item.isComplete! ? 1 : 0),
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<List<Task>> listAllTask() async {
    return _queryAdapter.queryList('SELECT * FROM Task',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            name: row['name'] as String?,
            content: row['content'] as String?,
            isComplete: row['isComplete'] == null
                ? null
                : (row['isComplete'] as int) != 0));
  }

  @override
  Future<List<Task>> findTasksComplete() async {
    return _queryAdapter.queryList('SELECT * FROM Task WHERE isComplete = true',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            name: row['name'] as String?,
            content: row['content'] as String?,
            isComplete: row['isComplete'] == null
                ? null
                : (row['isComplete'] as int) != 0));
  }

  @override
  Future<List<Task>> findTasksIncomplete() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Task WHERE isComplete = false',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            name: row['name'] as String?,
            content: row['content'] as String?,
            isComplete: row['isComplete'] == null
                ? null
                : (row['isComplete'] as int) != 0));
  }

  @override
  Future<Task?> findTask(int id) async {
    return _queryAdapter.query('SELECT * FROM Task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            name: row['name'] as String?,
            content: row['content'] as String?,
            isComplete: row['isComplete'] == null
                ? null
                : (row['isComplete'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertTask(Task task) async {
    await _taskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _taskDeletionAdapter.delete(task);
  }
}
