import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_hivepackage_app/View/screens/home_screen.dart';
import 'package:to_do_hivepackage_app/View/screens/task_screen.dart';
import 'package:to_do_hivepackage_app/data/hive_data_store.dart';
import 'package:to_do_hivepackage_app/models/task_model.dart';

Future<void> main() async {
  Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  Box<TaskModel> box = await Hive.openBox<TaskModel>(HiveDataStore.boxName);
  box.values.forEach((task) {
    if (task.createdAtDate != DateTime.now()) {
      box.delete(task.id);
    }
  });
  runApp(Basewidget(child: const MyApp()));
}

class Basewidget extends InheritedWidget {
  Basewidget({Key? key, required this.child}) : super(key: key, child: child);
  final Widget child;
  final HiveDataStore hivedata = HiveDataStore();
  static Basewidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<Basewidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
