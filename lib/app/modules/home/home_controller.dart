import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  int tabIndex = 0;

  final persons = List<Person>.generate(
    20,
    (index) => Person(
      name: 'Ronaldinho $index',
      points: index * 100,
      lastPosition: 0,
    ),
  ).asObservable();

  @action
  void changeIndex(int index) {
    if (tabIndex != index) {
      tabIndex = index;
    }

    return;
  }
}

class Person {
  final String imageUrl;
  final String name;
  final int points;
  final int lastPosition;

  Person({this.name, this.points, this.lastPosition, this.imageUrl});
}
