import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ranking_challenge/app/app_controller.dart';
import 'package:ranking_challenge/app/stores/authentication_store.dart';

import 'login_repository_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store, Disposable {
  ReactionDisposer loginDisposer;
  final ILoginRepository _repository = Modular.get();
  final AppController _appController = Modular.get();

  _LoginBase() {
    loginDisposer = when(
      (_) =>
          authFuture?.status == FutureStatus.fulfilled &&
          authFuture.value != null,
      () {
        _appController.login(authFuture.value);
      },
    );
  }

  @override
  void dispose() {
    if (loginDisposer != null) {
      loginDisposer();
    }
  }

  @observable
  String user = "david@flutterando.com.br";
  @action
  void setUser(String val) => user = val;

  @observable
  String pass = "123456";
  @action
  void setPass(String val) => pass = val;

  @observable
  ObservableFuture<AuthenticationStore> authFuture;

  @computed
  bool get isLoading => authFuture?.status == FutureStatus.pending;

  @computed
  dynamic get error => authFuture?.error;

  @action
  void login() {
    authFuture = _repository.login(user, pass).asObservable();
  }
}
