import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/login/controller/teddy.dart';

class Service extends ChangeNotifier {
  String pass = "admin";
  String user = "admin";

  String animationType = "idle";

  final teddyController = TeddyController();

  final passwordController = TextEditingController();
  final userController = TextEditingController();
  final passwordFocusNode = FocusNode();

  init() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        animationType = "test";
        print('test');
        notifyListeners();
      } else {
        animationType = "idle";
        print('idle');
        notifyListeners();
      }
    });
  }

  void pressed() {
    if (passwordController.text.compareTo(pass) == 0 &&
        userController.text.compareTo(user) == 0) {
      animationType = "success";
       notifyListeners();
    } else {
      animationType = "fail";
       notifyListeners();
    }
  }
}
