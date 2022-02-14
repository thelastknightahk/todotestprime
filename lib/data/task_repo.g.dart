// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_repo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskRepoAdapter extends TypeAdapter<TaskRepo> {
  @override
  final int typeId = 1;

  @override
  TaskRepo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskRepo(
      taskDataList: (fields[0] as List?)?.cast<TaskData>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskRepo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.taskDataList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskRepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
