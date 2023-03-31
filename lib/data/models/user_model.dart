import 'package:json_annotation/json_annotation.dart';
import 'package:sense_more/data/models/room_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'name')
  final String? fullName;
  final String? email;
  @JsonKey(name: 'image')
  final String? profileImage;
  @JsonKey(name: 'is_manager')
  final bool? isManager;
  @JsonKey(name: 'job_title')
  final String? jobTitle;
  @JsonKey(name: 'room_id')
  final int? roomID;
  RoomModel? room;
  UserModel({
    this.fullName,
    this.email,
    this.profileImage,
    this.isManager,
    this.jobTitle,
    this.roomID,
    this.room,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
