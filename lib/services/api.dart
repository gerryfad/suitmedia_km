import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Api {
  final Dio _dio = new Dio();

  Future<User> getUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users/2");
    final response = await http.get(url);

    var data = (jsonDecode(response.body) as Map<String, dynamic>)["data"];
    User user = User.fromJson(data);

    if (response.statusCode == 200) {
      return user;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<User>> getAllUser(int page) async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=$page&per_page=10");
    final response = await http.get(url);
    var data = (json.decode(response.body)['data']);
    List<User> user = User.fromJsonList(data);

    return user;
  }

  Future<List<User>> getAllUserDio(int page) async {
    Response response =
        await _dio.get("https://reqres.in/api/users?page=$page&per_page=10");

    List<User> user = User.fromJsonList(response.data["data"]);
    return user;
  }
}
