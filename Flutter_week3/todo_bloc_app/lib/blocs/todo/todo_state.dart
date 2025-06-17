import 'package:equatable/equatable.dart';
import '../../models/todo_model.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;
  TodoLoaded(this.todos);
  @override
  List<Object> get props => [todos];
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
  @override
  List<Object> get props => [message];
}
