import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:superbase_flutter/data/models/response/user.dart';
part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse extends Equatable {
  final User? user;

  const CreateUserResponse({this.user});

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);

  @override
  List<Object?> get props => [user];
}

@JsonSerializable()
class UpdateProfileUserResponse extends Equatable {
  final User? user;

  const UpdateProfileUserResponse({required this.user});

  factory UpdateProfileUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileUserResponseFromJson(json);

  @override
  List<Object?> get props => [];
}
