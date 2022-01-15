import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Api {
  Future<Result> listUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=1&per_page=10");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Result.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
