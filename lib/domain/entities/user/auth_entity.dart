import 'package:wcars/domain/entities/User/user_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthEntity {
  final String? token;
  final UserEntity? user;
  const AuthEntity({
    required this.token,
    required this.user,
  });

  factory AuthEntity.fromMap(Map<String, dynamic> map) {
    return AuthEntity(
      token: map['access_token'],
      user: UserEntity.fromMap(map['user']),
    );
  }
}
