class CarroEntity {
  final int id;
  final String nome;
  final String marca;
  final String modelo;
  final double preco;
  final String foto;

  CarroEntity(
      {required this.id,
      required this.nome,
      required this.marca,
      required this.modelo,
      required this.preco,
      required this.foto});

  static List<CarroEntity> fromMapList(List<dynamic> data) {
    return List.from(data)
        .map((element) => CarroEntity.fromJson(element))
        .toList();
  }

  factory CarroEntity.fromJson(Map<String, dynamic> json) {
    return CarroEntity(
      id: json['id'],
      nome: json['nome'],
      marca: json['marca'],
      modelo: json['modelo'],
      preco: json['preco'].toDouble(),
      foto: json['foto'],
    );
  }
}
