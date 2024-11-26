// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:provap2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provap2/model/carro.dart';
import 'package:provap2/model/user.dart';

class DaoRealTime {
  static final FirebaseDatabase db = FirebaseDatabase.instance;

  static void inicializa() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void salvarUser( Usser u, int _counter) {
    db.ref("User").child("User$_counter").set(u.toMap).onError(
          (error, stackTrace) => print("Erro ao salvar usuario: $error"),
        );
  }

  static void salvarCarro( Carro c, int _counter) {
    db.ref("Carro").child("Carro$_counter").set(c.toMap).onError(
          (error, stackTrace) => print("Erro ao salvar usuario: $error"),
        );
  }

  static void salvarAutoIDUser(Usser u) {
    db.ref("User").push().set(u.toMap).catchError(
          (error) => print("Erro ao salvar usuario: $error"),
        );
  }
  static void salvarAutoIDCarro(Carro c) {
    db.ref("Carro").push().set(c.toMap).catchError(
          (error) => print("Erro ao salvar usuario: $error"),
        );
  }

  // Função para buscar clientes do Realtime Database
  static Stream<List<Usser>> getClientes() {
    return db.ref("clientes").onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((entry) {
        final clienteData = entry.value as Map;
        return Usser(
          nome: clienteData['nome'],
          idade: clienteData['idade'],
        );
      }).toList();
    });
  }

  static Stream<List<Carro>> getCarros() {
    return db.ref("carros").onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((entry) {
        final carroData = entry.value as Map;
        return Carro(
          marca: carroData['Marca'],
          ano: carroData['Ano'],
          cor: carroData['Cor'],
          quilometragem: carroData['Quilometragem']
        );
      }).toList();
    });
  }
}