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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          isComplete == other.isComplete &&
          content == other.content;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ isComplete.hashCode ^ content.hashCode;
}
