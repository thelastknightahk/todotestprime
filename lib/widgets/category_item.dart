import 'package:flutter/material.dart';
import 'package:todo/model/category.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

Widget CategoryItem(BuildContext context, List<Category>? categoryList) {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categoryList!.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            width: 200,
            margin: EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Text(
                    '${categoryList[index].taskNumber} tasks',
                    style: TextStyle(color: greyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Text(
                    '${categoryList[index].categoryName}',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: LinearProgressIndicator(
                    value: categoryList[index].jobDone,
                    backgroundColor: Colors.black12,
                    color: colorList[index],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
