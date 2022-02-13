import 'package:flutter/material.dart';
import 'package:todo/model/category.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';
import 'package:todo/widgets/category_item.dart';
import 'package:todo/widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category>? categoryList;
  List<Task>? taskList;
  var fullWidth, fullHeight;
  @override
  void initState() {
    super.initState();
  }

  Future fetchCategoryData() async {
    categoryList = <Category>[];
    categoryList!.add(Category(
        categoryName: 'Personal',
        categoryColorIndex: 1,
        jobDone: 0.4,
        taskNumber: '12'));
    categoryList!.add(Category(
        categoryName: 'Business',
        categoryColorIndex: 2,
        jobDone: 0.2,
        taskNumber: '3'));
    categoryList!.add(Category(
        categoryName: 'Work',
        categoryColorIndex: 0,
        jobDone: 0.5,
        taskNumber: '24'));
    return categoryList;
  }

  Future fetchTaskList() async {
    taskList = <Task>[];
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: true,
        nameTask: 'P Task1',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: true,
        nameTask: 'P Task2',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: false,
        nameTask: 'P Task3',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: false,
        nameTask: 'P Task4',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Work',
        colorTaskIndex: 1,
        dateTask: '',
        finishTask: true,
        nameTask: 'W Task1',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Business',
        colorTaskIndex: 2,
        dateTask: '',
        finishTask: false,
        nameTask: 'B Task1',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Business',
        colorTaskIndex: 2,
        dateTask: '',
        finishTask: true,
        nameTask: 'B Task2',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Business',
        colorTaskIndex: 2,
        dateTask: '',
        finishTask: false,
        nameTask: 'B Task3',
        timeTask: '10:00 AM'));

    return taskList;
  }

  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(right: MARGIN_MEDIUM_3, top: MARGIN_MEDIUM_3),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.notifications_active,
                  color: blackColor,
                  // notifications_none_outlined
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(MARGIN_MEDIUM_3),
              child: Text(
                "What's up, Joy!",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: TEXT_REGULAR_3X),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MARGIN_XLARGE, left: MARGIN_MEDIUM_3),
              child: Text(
                "CATEGORIES",
                style:
                    TextStyle(color: blackLightColor, fontSize: TEXT_REGULAR),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: MARGIN_MEDIUM_3, top: MARGIN_MEDIUM_2),
              height: fullHeight / 6,
              child: FutureBuilder(
                  future: fetchCategoryData(),
                  builder: (context, projectSnap) {
                    if (!projectSnap.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return CategoryItem(context, categoryList);
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MARGIN_XLARGE,
                  left: MARGIN_MEDIUM_3,
                  bottom: MARGIN_MEDIUM_3),
              child: Text(
                "TODAY'S TASKS",
                style:
                    TextStyle(color: blackLightColor, fontSize: TEXT_REGULAR),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchTaskList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return taskItem(context, taskList);
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
