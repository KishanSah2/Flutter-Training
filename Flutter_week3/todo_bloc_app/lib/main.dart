import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo_model.dart';
import 'screens/home_screen.dart';
import 'blocs/todo/todo_bloc.dart';
import 'blocs/todo/todo_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(Hive.box<TodoModel>('todos'))..add(LoadTodos()),
      child: MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: HomeScreen(),
      ),
    );
  }
}
