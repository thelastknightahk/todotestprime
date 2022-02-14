import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';

class NotePresenter extends ChangeNotifier {
  List<Task> taskList = [];

  int _categoryAddColorIndex = 0;
  String _categoryAddName = 'Personal';
  String _categoryAddTask = '';
  String _categoryAddCalender = 'Today';
  String _categoryAddTime = 'Time';

  int _categoryUpdateColorIndex = 0;
  int _categoryItemUpdateIndex = 0;
  String _categoryUpdateName = 'Personal';
  String _categoryUpdateTask = '';
  String _categoryUpdateCalender = 'Today';
  String _categoryUpdateTime = '00:00';

  int get categoryAddColorIndex => _categoryAddColorIndex;
  String get categoryAddName => _categoryAddName;
  String get categoryAddCalender => _categoryAddCalender;
  String get categoryAddTime => _categoryAddTime;
  String get categoryTaskName => _categoryAddTask;

  int get categoryUpdateColorIndex => _categoryUpdateColorIndex;
  int get categoryUpdateItemIndex => _categoryItemUpdateIndex;
  String get categoryUpdateName => _categoryUpdateName;
  String get categoryUpdateCalender => _categoryUpdateCalender;
  String get categoryUpdateTime => _categoryUpdateTime;
  String get categoryUpdateTask => _categoryUpdateTask;

  // add note presenter
  void categoryAddColorIndexSet(int index) {
    _categoryAddColorIndex = index;
    notifyListeners();
  }

  void categoryAddNameSet(String categoryName) {
    _categoryAddName = categoryName;
    notifyListeners();
  }

  void categoryAddTimeSet(String categoryTime) {
    _categoryAddTime = categoryTime;
    notifyListeners();
  }

  void categoryAddCalenderSet(String categoryCalender) {
    _categoryAddCalender = categoryCalender;
    notifyListeners();
  }

  void categoryAddTaskSet(String categoryTask) {
    _categoryAddTask = categoryTask;
    notifyListeners();
  }

  // update note presenter

  void categoryUpdateColorIndexSet(int index) {
    _categoryUpdateColorIndex = index;
    notifyListeners();
  }

  void categoryUpdateNameSet(String categoryName) {
    _categoryUpdateName = categoryName;
    notifyListeners();
  }

  void categoryUpdateTimeSet(String categoryTime) {
    _categoryUpdateTime = categoryTime;
    notifyListeners();
  }

  void categoryUpdateCalenderSet(String categoryCalender) {
    _categoryUpdateCalender = categoryCalender;
    notifyListeners();
  }

  void categoryUpdateTaskSet(String categoryTask) {
    _categoryUpdateTask = categoryTask;
    notifyListeners();
  }

  void categoryUpdateItemIndexSet(int indexUpdate) {
    _categoryItemUpdateIndex = indexUpdate;
    notifyListeners();
  }

  //get task data

  Future getTaskList() async {
    return taskList;
  }

  Future taskListSet(Task task) async {
    taskList.add(task);
    notifyListeners();
  }

  // delete
  Future taskDeleteSet(Task task) async {
    int index = taskList.indexOf(task);
    taskList.removeAt(index);
    notifyListeners();
  }

  // update
  Future taskUpdateSet() async {
    var task = Task(
        categoryName: _categoryUpdateName,
        colorTaskIndex: _categoryUpdateColorIndex,
        dateTask: _categoryUpdateCalender,
        finishTask: false,
        nameTask: _categoryUpdateTask,
        timeTask: _categoryUpdateTime);
    taskList[categoryUpdateItemIndex] = task;

    notifyListeners();
  }

  // update
  Future taskUpdateSetCheck(Task taskData, bool finishBool) async {
    var task = Task(
        categoryName: taskData.categoryName,
        colorTaskIndex: taskData.colorTaskIndex,
        dateTask: taskData.dateTask,
        finishTask: finishBool,
        nameTask: taskData.nameTask,
        timeTask: taskData.timeTask);
    taskList[categoryUpdateItemIndex] = task;

    notifyListeners();
  }
}
