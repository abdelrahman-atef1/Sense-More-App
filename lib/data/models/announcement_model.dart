import 'package:json_annotation/json_annotation.dart';

import 'package:sense_more/data/models/user_model.dart';

part 'announcement_model.g.dart';

@JsonSerializable()
class AnnouncementsModel {
  String date;
  String announcement;
  String uid;
  UserModel? user;
  AnnouncementsModel({
    required this.date,
    required this.announcement,
    required this.uid,
    this.user,
  });
factory AnnouncementsModel.fromJson(Map<String, dynamic> json) => _$AnnouncementsModelFromJson(json);

Map<String, dynamic> toJson() => _$AnnouncementsModelToJson(this);
}
