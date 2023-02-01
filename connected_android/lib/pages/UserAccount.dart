import 'package:connected_android/color_schemes.g.dart';
import 'package:connected_android/pages/Successful_registration.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          children: <Widget>[
            const SizedBox(height: 30),
            Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                const Text('Paso 2: Indormación de usuario'),
              ],
            ),
            const SizedBox(height: 27),
            TextField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Foto de perfil', style: TextStyle(fontSize: 20, color: lightColorScheme.onSurface),),
                          Text('Subir foto', style: TextStyle(fontSize: 14, color: lightColorScheme.onSurface),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset('images/people/placeholder.png', fit: BoxFit.cover,)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ubicación', style: TextStyle(fontSize: 20, color: lightColorScheme.onSurface),),
                          Text('Seleccionar ubicación', style: TextStyle(fontSize: 16, color: lightColorScheme.onSurfaceVariant),),
                          Icon(Icons.place_outlined),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 500,
                    child: Image.asset('images/placeholders/mapplaceholder.png', fit: BoxFit.cover,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Regresar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('Registrarme'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Successful_registration())
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