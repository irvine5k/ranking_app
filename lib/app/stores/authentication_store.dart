import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStoreBase with _$AuthenticationStore;

abstract class _AuthenticationStoreBase with Store {
  @observable
  String uid;
  @action
  void setUid(String val) => uid = val;

  @observable
  String email;
  @action
  void setEmail(String val) => email = val;

  @observable
  String name;
  @action
  void setName(String val) => name = val;

  Future<AuthenticationStore> fromAuthResult(AuthResult model) async {
    if (model == null) return null;

    final response = AuthenticationStore()
      ..email = model.user?.email
      ..name = model.user?.displayName
      ..uid = model.user?.uid;

    return response;
  }
}
