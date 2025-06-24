import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUsers extends UserEvent {
  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  final String name;
  final String email;

  AddUser(this.name, this.email);

  @override
  List<Object> get props => [name, email];
}
