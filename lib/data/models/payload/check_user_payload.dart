import 'package:json_annotation/json_annotation.dart';
part 'check_user_payload.g.dart';

@JsonSerializable()
class CheckUserPayload {
  final String access_token;
  final String method;

  CheckUserPayload({required this.access_token, required this.method});
  factory CheckUserPayload.fromJson(Map<String, dynamic> json) =>
      _$CheckUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUserPayloadToJson(this);
}
