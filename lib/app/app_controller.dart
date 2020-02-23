import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'stores/authentication_store.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  AuthenticationStore authentication;

  void login(AuthenticationStore model) {
    authentication = model;
    Modular.to.pushReplacementNamed("/home");
  }

  void logout() {
    authentication = null;
    Modular.to.pushNamedAndRemoveUntil("/login", (route) => true);
  }
}
