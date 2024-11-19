class User {
  final int? id;
  final String email;
  final String senha;

  User({
    this.id,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
    };
  }
}
