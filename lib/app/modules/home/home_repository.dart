import 'package:flutter_modular/flutter_modular.dart';
import 'package:ranking_challenge/app/shared/connection/custom_hasura_connect.dart';

import 'position_model.dart';

abstract class IHomeRepository extends Disposable {
  Stream<List<PositionModel>> getData();
}

class HomeRepository implements IHomeRepository {
  final CustomHasuraConnect _connection = Modular.get();

  Stream<List<PositionModel>> getData() {
    final query = r"""
      subscription Ranking {
        position: users(order_by: {points: desc}) {
          name
          id
          points
        }
      }
    """;

    return _connection.client
        .subscription(query)
        .map((json) => PositionModel.fromMapList(json["data"]["position"]));
  }

  @override
  void dispose() {}
}
