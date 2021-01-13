import 'package:flutter_modular/flutter_modular.dart';
import 'package:ranking_challenge/app/shared/connection/custom_hasura_connect.dart';

import 'home_repository.dart';
import 'position_model.dart';

class MockHomeRepository implements IHomeRepository {
  final CustomHasuraConnect _connection = Modular.get();

  Stream<List<PositionModel>> getData() async* {
    // await Future.delayed(Duration(seconds: 1));
    yield [
      PositionModel(id: "1", name: "Wallace", points: 3500),
      PositionModel(id: "2", name: "Deivão", points: 2500),
      PositionModel(id: "3", name: "Bwolf", points: 1500),
    ];
  }

  @override
  void dispose() {}
}
