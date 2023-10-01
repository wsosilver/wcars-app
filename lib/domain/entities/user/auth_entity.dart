import 'package:flutter/foundation.dart';
import 'package:wcars/domain/entities/user/user_entity.dart';

@immutable
class AuthEntity {
  final String? token;
  final UsuarioEntity? user;
  const AuthEntity({
    required this.token,
    required this.user,
  });

  factory AuthEntity.fromMap(Map<String, dynamic> map) {
    return AuthEntity(
      token: map['access_token'],
      user: UsuarioEntity.fromMap(map['user']),
    );
  }
}
