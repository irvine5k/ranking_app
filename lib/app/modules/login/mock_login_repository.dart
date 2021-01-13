import 'package:ranking_challenge/app/stores/authentication_store.dart';

import 'login_repository_interface.dart';

class MockLoginRepository extends ILoginRepository {
  Future<AuthenticationStore> login(String user, String pass) async {
    await Future.delayed(Duration(seconds: 2));
    return AuthenticationStore()
      ..email = user
      ..name = "Deivão"
      ..uid = "#uniqueid";
  }

  @override
  void dispose() {}
}
