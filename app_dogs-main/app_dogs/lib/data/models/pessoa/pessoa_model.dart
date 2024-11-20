class Pessoa {
  final int? id; //permite ser null
  final String nome;
  final String telefone; //poder ser null
  final String email;
  final String enderecoAvRua;
  final String enderecoNumero;
  final String enderecoCep;
  final String enderecoCidade;
  final String enderecoEstado;
  final String bairro;

  Pessoa({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.enderecoAvRua,
    required this.enderecoNumero,
    required this.enderecoCidade,
    required this.enderecoCep,
    required this.enderecoEstado,
    required this.bairro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'enderecoAvRua': enderecoAvRua,
      'enderecoNumero': enderecoNumero,
      'enderecoCidade': enderecoCidade,
      'enderecoCep': enderecoCep,
      'enderecoEstado': enderecoEstado,
      'bairro': bairro
    };
  }
  //factory Pessoa.fromMap (Map<String>)
}
