import 'package:json_annotation/json_annotation.dart';

import 'package:sense_more/data/models/user_model.dart';

part 'room_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RoomModel {
  int? id;
  String? name;
  bool? isWorkArea;
  RoomModel(
    this.id,
    this.name,
    this.isWorkArea,
  );

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
