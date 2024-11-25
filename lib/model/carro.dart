class Carro {
  String marca;
  String cor;
  String ano;
  int kilometragem;

  Carro({required this.ano, required this.cor, required this.marca,required this.kilometragem});

   Map<String,dynamic>  get toMap => <String,dynamic>{"Marca":marca,"Cor":cor, "Ano":ano,"Kilometragem":kilometragem};
}