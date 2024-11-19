class User {
  final int? id;
  final int? idPessoa;
  final String senha;
  final String usuario;

  User({
    this.id,
    required this.idPessoa,
    required this.senha,
    required this.usuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPessoa': idPessoa,
      'senha': senha,
      'usuario': usuario,
    };
  }
}
