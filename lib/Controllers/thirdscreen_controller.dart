import 'package:get/get.dart';
import 'package:suitmedia_km/services/api.dart';
import '../models/user.dart';

class ThirdScreenController extends GetxController {
  int page = 1;
  final Api api = Api();

  Future<List<User>> getAllUser() async {
    return api.getAllUser(page);
  }

  Future<List<User>> getAllUserDio() async {
    return api.getAllUserDio(page);
  }

  Future<User> getUser() {
    return api.getUser();
  }

  void nextPage() {
    page++;
    update();
  }
}
