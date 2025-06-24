import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );
      return (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      // You can log the error or rethrow a custom exception
      print('Error fetching users: $e');
      throw Exception('Failed to load users');
    }
  }

  Future<UserModel> addUser(String name, String email) async {
    final response = await _dio.post(
      'https://jsonplaceholder.typicode.com/users',
      data: {'name': name, 'email': email},
    );
    return UserModel.fromJson({
      ...response.data,
      'id': 99,
    }); // Fake id for placeholder
  }
}
