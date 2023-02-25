import 'package:json_annotation/json_annotation.dart';

part 'network_error_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkErrorModel {
  int statusCode;
  String statusMessage;
  bool success;

  NetworkErrorModel(this.statusCode, this.statusMessage, this.success);

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) {
    return _$NetworkErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkErrorModelToJson(this);
}