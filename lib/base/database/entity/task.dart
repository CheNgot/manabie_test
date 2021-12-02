import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  final int? id ;

  final String? name;

   bool? isComplete;
  final String? content;

  @override
  String toString() {
    return 'Task{id: $id, name: $name, isComplete: $isComplete, content: $content}';
  }
  Task({ this.id,
    required this.name,
    required this.content,
    required this.isComplete});

}
