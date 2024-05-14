// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UpdateProfileUserResponse _$UpdateProfileUserResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileUserResponse(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileUserResponseToJson(
        UpdateProfileUserResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
