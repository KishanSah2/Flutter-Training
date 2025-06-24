import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<UserModel> users;
  UserLoaded(this.users);
  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
  @override
  List<Object> get props => [message];
}
