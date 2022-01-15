import 'package:get/get.dart';

class SecondScreenController extends GetxController {
  var user = "".obs;
  var selected = "".obs;

  void changeUsername(String username) {
    user.value = username;
  }

  void changeSelectedUser(String username) {
    selected.value = username;
  }
}
