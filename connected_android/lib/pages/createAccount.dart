import 'package:connected_android/pages/UserAccount.dart';
import 'package:flutter/material.dart';

class createAccount extends StatelessWidget {
  const createAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 45),
          children: <Widget>[
            const SizedBox(height: 16),
            Column(
              children: <Widget>[
                const SizedBox(height: 16),
                const Text('Paso 1: Información de inicio de sesión')
              ],
            ),
            const SizedBox(height: 30),
            // Emial
            TextField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'example@email.com',
              ),
            ),
            // Spacer
            const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.remove_red_eye_outlined),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
            // Spacer
            // Confirmar Password
            const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.remove_red_eye_outlined),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
            SizedBox(height: 15),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Continuar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserAccount())
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}