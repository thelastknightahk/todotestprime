import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

Widget taskItem(BuildContext context, List<Task>? taskList) {
  const index = 0;
  return Consumer<NotePresenter>(
    builder: (context, presenter, child) => Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: taskList!.length,
          itemBuilder: (context, index) {
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: [
                IconSlideAction(
                  caption: 'Update',
                  color: Colors.blue,
                  icon: Icons.update,
                  onTap: () => {
                    Navigator.pushNamed(context, '/updaeNote'),
                    presenter.categoryUpdateItemIndexSet(index),
                    presenter
                        .categoryUpdateCalenderSet(taskList[index].dateTask!),
                    presenter.categoryUpdateColorIndexSet(
                        taskList[index].colorTaskIndex!),
                    presenter.categoryUpdateTaskSet(taskList[index].nameTask!),
                    presenter
                        .categoryUpdateNameSet(taskList[index].categoryName!),
                    presenter.categoryUpdateTimeSet(taskList[index].timeTask!),
                  },
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.redAccent,
                  icon: Icons.delete,
                  onTap: () => {presenter.taskDeleteSet(taskList[index])},
                ),
              ],
              child: Card(
                elevation: 0.3,
                child: Container(
                  child: Row(
                    children: [
                      InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          var task = taskList[index];

                          presenter.taskUpdateSetCheck(task, !task.finishTask!);
                          //print('clicked circle ${index}');
                        },
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          margin: EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              color: taskList[index].finishTask == true
                                  ? Colors.black12
                                  : null,
                              //color: Colors.black26,
                              border: Border.all(
                                  width: 2.5,
                                  color: colorList[
                                      taskList[index].colorTaskIndex!]),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "${taskList[index].nameTask}",
                          style: TextStyle(
                              decoration: taskList[index].finishTask == true
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontSize: TEXT_REGULAR,
                              color: blackColor),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: MARGIN_MEDIUM),
                        child: Text(
                          "${taskList[index].timeTask}",
                          style: TextStyle(
                              decoration: taskList[index].finishTask == true
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontSize: TEXT_REGULAR,
                              color: blackColor),
                        ),
                      )
                    ],
                  ),
                  height: CARD_HEIGHT,
                ),
              ),
            );
          }),
    ),
  );
}

void updateItem(BuildContext context) {
  print("Update");
}

void deleteItem(BuildContext context) {
  print("Delete");
}
