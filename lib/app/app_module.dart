import 'package:ranking_challenge/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ranking_challenge/app/app_widget.dart';
import 'package:ranking_challenge/app/modules/home/home_module.dart';
import 'package:ranking_challenge/app/modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
