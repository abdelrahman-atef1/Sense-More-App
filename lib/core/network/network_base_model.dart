import 'package:json_annotation/json_annotation.dart';

part 'network_base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkBaseModel<T> {
  @JsonKey(name: 'Code')
  int? code;
  @JsonKey(name: 'Message')
  String? message;
  @JsonKey(name: 'isEmailExist')
  bool? isEmailExist;
  @JsonKey(name: 'Data')
  T data;

  NetworkBaseModel({required this.code, required this.message, required this.data});

  factory NetworkBaseModel.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) =>
      _$NetworkBaseModelFromJson(json,fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$NetworkBaseModelToJson(this,toJsonT);
}
