class Usser {
  String nome;
  int idade;

  Usser({required this.idade, required this.nome});

  Map<String, dynamic > get toMap => <String, dynamic>{"nome": nome, "idade": idade};


}