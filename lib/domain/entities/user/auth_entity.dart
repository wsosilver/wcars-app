import 'package:flutter/foundation.dart';

@immutable
class AuthEntity {
  final String? token;
  const AuthEntity({
    required this.token,
  });

  factory AuthEntity.fromMap(Map<String, dynamic> map) {
    return AuthEntity(
      token: map['access_token'],
    );
  }
}
