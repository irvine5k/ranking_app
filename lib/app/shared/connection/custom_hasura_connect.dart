import 'package:firebase_auth/firebase_auth.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CustomHasuraConnect {
  HasuraConnect client;
  CustomHasuraConnect() {
    client = HasuraConnect(
      "https://ranking-flutterando-official.herokuapp.com/v1/graphql",
      token: token,
    );
    client.changeToken(token);
  }

  Future<String> token(bool isError) async {
    final user = await FirebaseAuth.instance.currentUser();
    final idToken = await user.getIdToken();
    return 'Bearer ${idToken.token}';
  }
}
