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
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.fullName,
      'email': instance.email,
      'image': instance.profileImage,
      'is_manager': instance.isManager,
      'job_title': instance.jobTitle,
    };
