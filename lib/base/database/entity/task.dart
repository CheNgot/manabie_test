import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  final int id ;

  final String name ;

  final bool isComplete;
  final String content;

  @override
  String toString() {
    return 'Person{id: $id, name: $name, isComplete: $isComplete, content: $content}';
  }

  Task(this.id, this.name, this.isComplete, this.content);
}