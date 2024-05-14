import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String? username;
  final String? phoneNumber;
  final String? name;
  final String? email;
  final String? gender;
  final dynamic photo;
  final String nickname;
  final String createdAt;
  final String updatedAt;
  final String? birth;
  final String? note;
  final String status;
  final String method;
  final bool? notification;
  final String? accessToken;
  final String? refreshToken;
  final dynamic ageRange;
  final bool? isPassApp;
  final bool? isBanned;
  final List<String>? roles;

  const User({
    required this.id,
    this.username,
    this.phoneNumber,
    this.name,
    this.email,
    required this.gender,
    required this.photo,
    required this.nickname,
    required this.createdAt,
    required this.updatedAt,
    this.birth,
    required this.note,
    required this.status,
    required this.method,
    required this.notification,
    required this.accessToken,
    required this.refreshToken,
    required this.ageRange,
    required this.isPassApp,
    required this.isBanned,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        username,
        phoneNumber,
        name,
        email,
        gender,
        photo,
        nickname,
        createdAt,
        updatedAt,
        birth,
        note,
        status,
        method,
        notification,
        accessToken,
        refreshToken,
        ageRange,
        isPassApp,
        isBanned,
        roles,
      ];
}
