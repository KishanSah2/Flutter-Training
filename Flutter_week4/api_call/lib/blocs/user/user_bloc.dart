import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import '../../repositories/user_repository.dart';
import '../../models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  List<UserModel> _users = [];

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        _users = await userRepository.fetchUsers();
        emit(UserLoaded(_users));
      } catch (_) {
        emit(UserError("Failed to load users"));
      }
    });

    on<AddUser>((event, emit) async {
      emit(UserLoading());
      try {
        final newUser = await userRepository.addUser(event.name, event.email);
        _users.add(newUser);
        emit(UserLoaded(_users));
      } catch (_) {
        emit(UserError("Failed to add user"));
      }
    });
  }
}
