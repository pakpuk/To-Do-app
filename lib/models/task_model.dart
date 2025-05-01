import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  TaskModel(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.createdAttime,
      required this.createdAtDate,
      required this.isCompleted});
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  final String subtitle;
  @HiveField(3)
  DateTime createdAttime;
  @HiveField(4)
  DateTime createdAtDate;
  @HiveField(5)
  bool isCompleted;

  factory TaskModel.create({
    required String? id,
    required String? title,
    required String? subtitle,
    required DateTime? createdAttime,
    required DateTime? createdAtDate,
  }) =>
      TaskModel(
        id: const Uuid().v1(),
        title: title ?? '',
        subtitle: subtitle ?? '',
        createdAttime: createdAttime ?? DateTime.now(),
        createdAtDate: createdAtDate ?? DateTime.now(),
        isCompleted: false,
      );
}
