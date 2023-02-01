import 'package:connected_android/color_schemes.g.dart';
import 'package:flutter/material.dart';

class Successful_registration extends StatelessWidget {
  const Successful_registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: lightColorScheme.primaryContainer,
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('images/placeholders/logowhite.png'),
              ),
              const Text(
                '¡Registro exitoso!',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text('Presiona para continuar', style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      // Siguiente pantalla
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}