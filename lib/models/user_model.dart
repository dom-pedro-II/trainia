class UserModel {
  final String nome;
  final String email;
  final String senha; // armazenada em hash
  final int idade;
  final double altura;
  final double peso;

  UserModel({
    required this.nome,
    required this.email,
    required this.senha,
    required this.idade,
    required this.altura,
    required this.peso,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'idade': idade,
      'altura': altura,
      'peso': peso,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
      idade: map['idade'],
      altura: map['altura'].toDouble(),
      peso: map['peso'].toDouble(),
    );
  }
}
