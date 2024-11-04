class Pessoa {
  final int? id;
  final String nome;
  final String telefone;
  final String email;
  final String endereco;

  Pessoa({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nome,
      'telefone': telefone,
      'email': email,
      'endereco': endereco,
    };
  }
}
