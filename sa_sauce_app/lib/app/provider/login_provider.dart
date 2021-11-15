import 'package:flutter/foundation.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';
import 'package:sa_sauce_app/app/utils/constants.dart';

import '../model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({required this.apiLogin});

  final ApiLogin? apiLogin;
  final constant = Constant();

  Future<void> getLogin(String username, String password) async {
    LoginModel loginResult = await apiLogin!.login(
      username: username,
      password: password,
    );
    constant.setToken(loginResult.token);
    notifyListeners();
  }

  bool getToken() {
    if (constant.token != '') {
      return true;
    } else {
      return true;
    }
  }

  void logout() {
    constant.setToken('');
    notifyListeners();
  }
}
