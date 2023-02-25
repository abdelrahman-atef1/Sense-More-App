import 'package:json_annotation/json_annotation.dart';

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
  UserModel({
    this.fullName,
    this.email,
    this.profileImage,
    this.isManager,
    this.jobTitle,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
