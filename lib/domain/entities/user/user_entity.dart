import 'package:flutter/foundation.dart';

@immutable
class UsuarioEntity {
  final int id;
  final String? nome;
  final String? sobrenome;

  const UsuarioEntity(
      {required this.id, required this.nome, required this.sobrenome});

  factory UsuarioEntity.fromMap(Map<String, dynamic> map) {
    return UsuarioEntity(
      id: map['id'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
    );
  }
}
