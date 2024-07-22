import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        backgroundColor: Colors.red[700],
        centerTitle: true,
      ),
      body: const Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
      child: const Text(
        'Hello World',
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 4,
        ),
      ),
    );
  }
}


// build(BuildContext context) {
//     return const Text('Neata!!!');
//   }
