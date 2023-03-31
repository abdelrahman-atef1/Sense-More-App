// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['name'] as String?,
      email: json['email'] as String?,
      profileImage: json['image'] as String?,
      isManager: json['is_manager'] as bool?,
      jobTitle: json['job_title'] as String?,
      roomID: json['room_id'] as int?,
      room: json['room'] == null
          ? null
          : RoomModel.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.fullName,
      'email': instance.email,
      'image': instance.profileImage,
      'is_manager': instance.isManager,
      'job_title': instance.jobTitle,
      'room_id': instance.roomID,
      'room': instance.room,
    };
