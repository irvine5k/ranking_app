import 'package:flutter_modular/flutter_modular.dart';
import 'package:ranking_challenge/app/stores/authentication_store.dart';

abstract class ILoginRepository extends Disposable{
  Future<AuthenticationStore> login(String user, String pass);
}