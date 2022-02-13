import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 2.5, color: Colors.grey)),
                    margin: EdgeInsets.all(MARGIN_13),
                    child: Icon(Icons.close_sharp),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 200.0,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(MARGIN_10),
                          child: TextField(
                            autofocus: true,
                            style: TextStyle(fontSize: 20.0),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter New Task',
                              hintStyle: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 130.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: greyColor,
                                  ),
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: TEXT_REGULAR_2X,
                                        color: greyColor),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  border: Border.all(
                                      width: 2, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            Container(
                              width: 130.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.lock_clock,
                                    color: greyColor,
                                  ),
                                  Text(
                                    '10:00 AM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: TEXT_REGULAR_2X,
                                        color: greyColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 130.0,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "New Task",
              style: TextStyle(color: mainColor, fontSize: TEXT_REGULAR_2X),
            ),
            Icon(
              Icons.keyboard_arrow_up,
              color: mainColor,
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
