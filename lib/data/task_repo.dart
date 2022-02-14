import 'package:hive/hive.dart';

import 'package:todo/data/task_data.dart';

part 'task_repo.g.dart';

@HiveType(typeId: 1)
class TaskRepo {
  @HiveField(0)
  List<TaskData>? taskDataList;
  TaskRepo({
    this.taskDataList,
  });
}
