import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodos extends TodoEvent {
  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final String title;
  AddTodo(this.title);
  @override
  List<Object> get props => [title];
}

class ToggleTodo extends TodoEvent {
  final int index;
  ToggleTodo(this.index);
  @override
  List<Object> get props => [index];
}

class DeleteTodo extends TodoEvent {
  final int index;
  DeleteTodo(this.index);
  @override
  List<Object> get props => [index];
}
