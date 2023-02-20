import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/data/models/user_model.dart';
part 'announcement_model.freezed.dart';
part 'announcement_model.g.dart';

@freezed
class AnnouncmentModel with _$AnnouncmentModel {
  const AnnouncmentModel._();
  const factory AnnouncmentModel({
    required String date,
    required String announcment,
    required String uid,
    UserModel? user,
  }) = _AnnouncmentModel;
  factory AnnouncmentModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncmentModelFromJson(json);
}
