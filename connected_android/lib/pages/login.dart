import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function togScreen;

  const Login({super.key, required this.togScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///const
                const SizedBox(height: 40),
                Image.asset(
                  'images/placeholders/logo.png',
                  width: 250,
                  height: 200,
                ),

                Text(
                  "Inicia Secion Para continuar",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400]),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email),
                        labelText: "Correo Electronico",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Contraseña",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Has olvidado tu contraseña ?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 125, 214, 128)),
                        child: const Text(
                          "Iniciar Secion",
                          style: TextStyle(fontSize: 20),
                        ))),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No tengo una cuenta",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => togScreen(),
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
