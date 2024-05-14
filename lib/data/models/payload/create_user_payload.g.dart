// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserPayload _$CreateUserPayloadFromJson(Map<String, dynamic> json) =>
    CreateUserPayload(
      method: json['method'] as String,
      access_token: json['access_token'] as String,
      nickname: json['nickname'] as String,
      notification: json['notification'] as bool,
      imp_uid: json['imp_uid'] as String,
      merchant_uid: json['merchant_uid'] as String,
      referrerName: json['referrerName'] as String,
    );

Map<String, dynamic> _$CreateUserPayloadToJson(CreateUserPayload instance) =>
    <String, dynamic>{
      'method': instance.method,
      'access_token': instance.access_token,
      'nickname': instance.nickname,
      'notification': instance.notification,
      'imp_uid': instance.imp_uid,
      'merchant_uid': instance.merchant_uid,
      'referrerName': instance.referrerName,
    };

UpdateProfileUserPayload _$UpdateProfileUserPayloadFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileUserPayload(
      notification: json['notification'] as bool?,
      image: json['image'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$UpdateProfileUserPayloadToJson(
    UpdateProfileUserPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notification', instance.notification);
  writeNotNull('image', instance.image);
  writeNotNull('nickname', instance.nickname);
  return val;
}
