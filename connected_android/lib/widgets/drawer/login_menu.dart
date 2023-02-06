import '../../globals.dart' as globals;
import 'package:flutter/material.dart';

class LoginMenu extends StatelessWidget {
  const LoginMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Inicia sesión')),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).colorScheme.outlineVariant)),
                  child: TextField(
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Correo electronico',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 16),
                      prefixIcon: const SizedBox(
                        width: 18,
                        child: Icon(Icons.email_outlined),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).colorScheme.outlineVariant)),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 16),
                      prefixIcon: const SizedBox(
                        width: 18,
                        child: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                FilledButton(
                    onPressed: () {
                      globals.isLoggedIn = true;
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                    ),
                    child: const Text('Iniciar sesión')),
                OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40)),
                    child: const Text('Registrarme')),
                TextButton(
                    onPressed: () {},
                    child: const Text('Olvidé mi contraseña')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
