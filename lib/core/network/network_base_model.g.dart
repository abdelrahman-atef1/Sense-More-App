// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkBaseModel<T> _$NetworkBaseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NetworkBaseModel<T>(
      code: json['Code'] as int?,
      message: json['Message'] as String?,
      data: fromJsonT(json['Data']),
    )..isEmailExist = json['isEmailExist'] as bool?;

Map<String, dynamic> _$NetworkBaseModelToJson<T>(
  NetworkBaseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'isEmailExist': instance.isEmailExist,
      'Data': toJsonT(instance.data),
    };
