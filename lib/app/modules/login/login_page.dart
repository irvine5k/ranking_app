import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_helpers/flutter_mobx_helpers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_button/loading_button.dart';
import 'package:ranking_challenge/app/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return ObserverListener(
      listener: (_) {
        if (controller.error != null) {
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Oops"),
              content: Text(controller.error.toString()),
              actions: <Widget>[
                RaisedButton(
                  child: Text("OK"),
                  onPressed: () => Modular.to.pop(),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryIconTheme.color,
                )
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Usuário"),
                onChanged: controller.setUser,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setPass,
              ),
              SizedBox(height: 25),
              Observer(builder: (_) {
                return LoadingButton(
                  isLoading: controller.isLoading,
                  onPressed: controller.login,
                  child: Text("Acessar"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
