// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      photo: json['photo'],
      nickname: json['nickname'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      birth: json['birth'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String,
      method: json['method'] as String,
      notification: json['notification'] as bool?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      ageRange: json['ageRange'],
      isPassApp: json['isPassApp'] as bool?,
      isBanned: json['isBanned'] as bool?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'photo': instance.photo,
      'nickname': instance.nickname,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'birth': instance.birth,
      'note': instance.note,
      'status': instance.status,
      'method': instance.method,
      'notification': instance.notification,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'ageRange': instance.ageRange,
      'isPassApp': instance.isPassApp,
      'isBanned': instance.isBanned,
      'roles': instance.roles,
    };
