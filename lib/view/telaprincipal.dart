import 'package:flutter/material.dart';
import 'package:provap2/view/telaCadastroCarro.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: 
        
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu de NAvegação'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Cadastro de Veiculos'),
              
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Telacadastrocarro()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('veliculos Registrados'),
              
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: const Text('Histórico de Abastecimentos'),
                onTap: (){
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                );
                Navigator.pop(context);
                },
            )
          ],
        ),
      ),
    );
  }
}