// To parse this JSON data, do
//
//     final positionModel = positionModelFromJson(jsonString);

import 'dart:convert';

PositionModel positionModelFromJson(String str) =>
    PositionModel.fromMap(json.decode(str));

String positionModelToJson(PositionModel data) => json.encode(data.toMap());

class PositionModel {
  final String name;
  final String id;
  final int points;
  final bool up;

  PositionModel({
    this.name,
    this.id,
    this.points,
    this.up = true,
  });

  PositionModel copyWith({
    String name,
    String id,
    int points,
    bool up,
  }) =>
      PositionModel(
        name: name ?? this.name,
        id: id ?? this.id,
        points: points ?? this.points,
        up: up ?? this.up,
      );

  factory PositionModel.fromMap(Map<String, dynamic> json) {
    if (json == null) return null;

    return PositionModel(
      name: json["name"] == null ? null : json["name"],
      id: json["id"] == null ? null : json["id"],
      points: json["points"] == null ? null : json["points"],
    );
  }

  static List<PositionModel> fromMapList(List list) {
    if (list == null) return null;
    return list.map((item) => PositionModel.fromMap(item)).toList();
  }

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "points": points == null ? null : points,
      };
}
