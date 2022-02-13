import 'package:flutter/material.dart';
import 'package:todo/screen/add_note.dart';
import 'package:todo/screen/home.dart';
import 'package:todo/screen/update_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/addNote': (context) => const AddNote(),
        '/updaeNote': (context) => const UpdateNote(),
      },
    );
  }
}
