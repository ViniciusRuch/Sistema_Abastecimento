class Carro {
  String marca;
  String cor;
  String ano;
  int quilometragem;

  Carro({required this.ano, required this.cor, required this.marca,required this.quilometragem});

   Map<String,dynamic>  get toMap => <String,dynamic>{"Marca":marca,"Cor":cor, "Ano":ano,"Quilometragem":quilometragem};
}