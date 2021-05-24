// To parse this JSON data, do
//
//     final graveyard = graveyardFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Graveyard> graveyardFromJson(String str) =>
    List<Graveyard>.from(json.decode(str).map((x) => Graveyard.fromJson(x)));

class Graveyard {
  Graveyard({
    @required this.dateClose,
    @required this.dateOpen,
    @required this.description,
    @required this.link,
    @required this.name,
    @required this.type,
  });

  final DateTime dateClose;
  final DateTime dateOpen;
  final String description;
  final String link;
  final String name;
  final Type type;

  factory Graveyard.fromJson(Map<String, dynamic> json) => Graveyard(
        dateClose: DateTime.parse(json["dateClose"]),
        dateOpen: DateTime.parse(json["dateOpen"]),
        description: json["description"],
        link: json["link"],
        name: json["name"],
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "dateClose":
            "${dateClose.year.toString().padLeft(4, '0')}-${dateClose.month.toString().padLeft(2, '0')}-${dateClose.day.toString().padLeft(2, '0')}",
        "dateOpen":
            "${dateOpen.year.toString().padLeft(4, '0')}-${dateOpen.month.toString().padLeft(2, '0')}-${dateOpen.day.toString().padLeft(2, '0')}",
        "description": description,
        "link": link,
        "name": name,
        "type": typeValues.reverse[type],
      };
}

enum Type { SERVICE, APP, HARDWARE }

final typeValues = EnumValues(
    {"app": Type.APP, "hardware": Type.HARDWARE, "service": Type.SERVICE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
