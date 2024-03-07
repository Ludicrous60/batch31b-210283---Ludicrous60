import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  AuthApiModel(
      {required this.id,
      required this.firstName,
      required this.lastName, 
      required this.email,
      required this.password});

  //toEntity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
        id: apiModel.id,
        firstName: apiModel.firstName,
        lastName: apiModel.lastName,
        email: apiModel.email,
        password: apiModel.password);
  }

  //From Entiry
  factory AuthApiModel.fromEntity(AuthEntity authEntity) {
    return AuthApiModel(
        id: authEntity.id,
        firstName: authEntity.firstName,
        lastName: authEntity.lastName,
        email: authEntity.email,
        password: authEntity.password);
  }

  AuthEntity toEntity() => AuthEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password);

  //FromJSON
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  //ToJSON
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);
}
