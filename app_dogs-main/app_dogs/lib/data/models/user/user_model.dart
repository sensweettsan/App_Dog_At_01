class User {
  final int? id;
  final int? idPessoa;
  final String email;
  final String senha;
  final String usuario;

  User({
    this.id,
    required this.idPessoa,
    required this.email,
    required this.senha,
    required this.usuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPessoa': idPessoa,
      'email': email,
      'senha': senha,
      'usuario': usuario,
    };
  }
}
