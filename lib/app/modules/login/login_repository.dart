import 'package:firebase_auth/firebase_auth.dart';
import 'package:ranking_challenge/app/stores/authentication_store.dart';

import 'login_repository_interface.dart';

class LoginRepository extends ILoginRepository {
  Future<AuthenticationStore> login(String user, String pass) async {
    AuthResult authResponse;
    try {
      authResponse = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user,
        password: pass,
      );
    } catch (ex) {
      if (ex.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        authResponse = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user,
          password: pass,
        );
      }
    }

    AuthenticationStore response;
    response = await AuthenticationStore().fromAuthResult(authResponse);
    return response;
  }

  @override
  void dispose() {}
}
