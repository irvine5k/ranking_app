import 'package:hasura_connect/hasura_connect.dart';
import 'package:ranking_challenge/app/app_controller.dart';
import 'package:ranking_challenge/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ranking_challenge/app/modules/home/home_page.dart';
import 'package:ranking_challenge/app/shared/connection/custom_hasura_connect.dart';

import 'home_repository.dart';
import 'mock_home_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => MockHomeRepository()),
        // Bind((i) => HomeRepository()),
        Bind((i) => CustomHasuraConnect()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
