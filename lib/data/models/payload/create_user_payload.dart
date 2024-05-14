import 'package:json_annotation/json_annotation.dart';
part 'create_user_payload.g.dart';

@JsonSerializable()
class CreateUserPayload {
  final String method;
  final String access_token;
  final String nickname;
  final bool notification;
  final String imp_uid;
  final String merchant_uid;
  final String referrerName;
  const CreateUserPayload({
    required this.method,
    required this.access_token,
    required this.nickname,
    required this.notification,
    required this.imp_uid,
    required this.merchant_uid,
    required this.referrerName,
  });

  factory CreateUserPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserPayloadToJson(this);
}

@JsonSerializable(includeIfNull: false)
class UpdateProfileUserPayload {
  bool? notification;
  String? image;
  String? nickname;
  UpdateProfileUserPayload({this.notification, this.image, this.nickname});

  factory UpdateProfileUserPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileUserPayloadToJson(this);
}
