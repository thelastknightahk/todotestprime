import 'package:hive/hive.dart';

part 'task_data.g.dart';

@HiveType(typeId: 2)
class TaskData {
  @HiveField(0)
  String? nameTask;

  @HiveField(1)
  String? categoryName;

  @HiveField(2)
  String? dateTask;

  @HiveField(3)
  int? colorTaskIndex;

  @HiveField(4)
  bool? finishTask;

  @HiveField(5)
  String? timeTask;
  TaskData({
    this.nameTask,
    this.categoryName,
    this.dateTask,
    this.colorTaskIndex,
    this.finishTask,
    this.timeTask,
  });
}
