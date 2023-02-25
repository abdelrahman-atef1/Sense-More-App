// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementsModel _$AnnouncementsModelFromJson(Map<String, dynamic> json) =>
    AnnouncementsModel(
      date: json['date'] as String,
      announcement: json['announcement'] as String,
      uid: json['uid'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnouncementsModelToJson(AnnouncementsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'announcement': instance.announcement,
      'uid': instance.uid,
      'user': instance.user,
    };
