// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnouncmentModel _$$_AnnouncmentModelFromJson(Map<String, dynamic> json) =>
    _$_AnnouncmentModel(
      date: json['date'] as String,
      announcment: json['announcment'] as String,
      uid: json['uid'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnnouncmentModelToJson(_$_AnnouncmentModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'announcment': instance.announcment,
      'uid': instance.uid,
      'user': instance.user,
    };
