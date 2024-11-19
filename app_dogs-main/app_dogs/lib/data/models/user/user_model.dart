class User {
  final int? id;
  final int? idPessoa;
  final String email;
  final String senha;

  User({
    this.id,
    this.idPessoa,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPessoa': idPessoa,
      'email': email,
      'senha': senha,
    };
  }
}
