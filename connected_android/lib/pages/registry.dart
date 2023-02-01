import 'package:connected_android/pages/createAccount.dart';
import 'package:flutter/material.dart';

class registry extends StatelessWidget {
  const registry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              child: const Text('Registrarme'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const createAccount())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}