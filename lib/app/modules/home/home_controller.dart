import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';
import 'home_repository.dart';
import 'position_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final AppController _appController = Modular.get();
  final HomeRepository _repository = Modular.get();

  _HomeBase() {
    getRanking();
  }

  @observable
  int tabIndex = 0;

  @computed
  ObservableList<PositionModel> get persons => _personsStream?.value?.asObservable();

  @observable
  ObservableStream<List<PositionModel>> _personsStream;

  @action
  void changeIndex(int index) {
    if (tabIndex != index) {
      tabIndex = index;
    }

    return;
  }

  @action
  void getRanking() {
    _personsStream = _repository.getData().asObservable();
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Atenção"),
        content: Text("Tem certeza que deseja sair?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Cancelar"),
            onPressed: () => Modular.to.pop(),
            textColor: Theme.of(context).primaryColor,
          ),
          RaisedButton(
            child: Text("Sim"),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryIconTheme.color,
            onPressed: () {
              _appController.logout();
            },
          ),
        ],
      ),
    );
    // _appController.logout();
  }
}
