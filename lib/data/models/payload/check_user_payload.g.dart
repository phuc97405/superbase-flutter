// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckUserPayload _$CheckUserPayloadFromJson(Map<String, dynamic> json) =>
    CheckUserPayload(
      access_token: json['access_token'] as String,
      method: json['method'] as String,
    );

Map<String, dynamic> _$CheckUserPayloadToJson(CheckUserPayload instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'method': instance.method,
    };
