class Pessoa {
  final int? id;
  final String name;
  final String telefone;
  final String email;
  final String endereco;

  Pessoa({
    this.id,
    required this.name,
    required this.telefone,
    required this.email,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'telefone': telefone,
      'email': email,
      'endereco': endereco,
    };
  }
}
