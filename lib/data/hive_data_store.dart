import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_hivepackage_app/models/task_model.dart';

class HiveDataStore {
  static const String boxName = 'taskbox';
  final Box<TaskModel> box = Hive.box<TaskModel>(boxName);

  Future<void> addTask(TaskModel taskModel, {required TaskModel task}) async {
    await box.put(task.id, task);
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  Future<void> updateTask({required TaskModel task}) async {
    await task.save();
  }

  Future<TaskModel?> getTask({required String id}) async {
    return box.get(id);
  }

  ValueListenable<Box<TaskModel>> taskListenable() => box.listenable();
}
