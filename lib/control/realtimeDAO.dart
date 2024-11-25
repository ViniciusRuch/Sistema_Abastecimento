import 'package:firebase_auth/firebase_auth.dart';
import 'package:provap2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provap2/model/user.dart';

class DaoRealTime {
  static final FirebaseDatabase db = FirebaseDatabase.instance;

  static void inicializa() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void salvar( Usser u, int _counter) {
    db.ref("User").child("cliente$_counter").set(u.toMap).onError(
          (error, stackTrace) => print("Erro ao salvar usuario: $error"),
        );
  }

  static void salvarAutoID(Usser u) {
    db.ref("User").push().set(u.toMap).catchError(
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
}