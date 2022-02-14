import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/task_data.dart';
import 'package:todo/data/task_repo.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/screen/add_note.dart';
import 'package:todo/screen/home.dart';
import 'package:todo/screen/update_note.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var path = Directory.current.path;
  await Hive.initFlutter(path);
  box = await Hive.openBox<TaskRepo>('todo');
  Hive
    ..init(path)
    ..registerAdapter(TaskRepoAdapter())
    ..registerAdapter(TaskDataAdapter());

  runApp(ChangeNotifierProvider(
    create: (context) => NotePresenter(),
    child: const MyApp(),
  ));
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
