import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/user/user_bloc.dart';
import 'repositories/user_repository.dart';
import 'screens/user_list_screen.dart';

void main() {
  final userRepository = UserRepository();

  runApp(MyApp(userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  MyApp(this.userRepository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: BlocProvider(
        create: (_) => UserBloc(userRepository),
        child: UserListScreen(),
      ),
    );
  }
}
