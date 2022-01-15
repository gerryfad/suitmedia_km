import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ThirdScreenController extends GetxController {
  var page = 2;

  Future<List> fetchUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=1&per_page=10");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      List Users = data.map((i) => Result.fromJson(i)).toList();
      return Users;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<dynamic>> fetchAllUsers() async {
    var page = 2;
    Uri url =
        Uri.parse("https://reqres.in/api/users?page='${page}&per_page=10'");
    final response = await http.get(url);
    var data = (json.decode(response.body)['data']);
    return data;
  }

  void nextPage() {
    page++;
  }
}
