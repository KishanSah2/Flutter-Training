import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../../models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Box<TodoModel> todoBox;
  TodoBloc(this.todoBox) : super(TodoInitial()) {
    on<LoadTodos>((event, emit) {
      emit(TodoLoading());
      try {
        final todos = todoBox.values.toList();
        emit(TodoLoaded(todos));
      } catch (_) {
        emit(TodoError("Failed to load todos"));
      }
    });

    on<AddTodo>((event, emit) {
      todoBox.add(TodoModel(title: event.title));
      add(LoadTodos());
    });

    on<ToggleTodo>((event, emit) {
      final todo = todoBox.getAt(event.index);
      if (todo != null) {
        todo.isDone = !todo.isDone;
        todo.save();
        add(LoadTodos());
      }
    });

    on<DeleteTodo>((event, emit) {
      todoBox.deleteAt(event.index);
      add(LoadTodos());
    });
  }
}
