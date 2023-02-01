import 'package:flutter/material.dart';

class Register extends StatelessWidget {

  final Function togSreen;

  const Register({super.key, required this.togSreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => togSreen(),
                      ),
                    ],
                  ),

                  ///const
                  const Text(
                    "Crear una nueva cuenta",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Inicia Secion para continuar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400]),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline, size: 30),
                          labelText: "Nombre",
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
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.photo, size: 30),
                          labelText: "Fotografia",
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
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.location_pin, size: 30),
                          labelText: "Localizacion",
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
                          prefixIcon: Icon(Icons.email),
                          labelText: "Correo electronico",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, size: 30),
                          labelText: "Contraseña",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 125, 214, 128)),
                          child: const Text(
                            "Create una cuenta",
                            style: TextStyle(fontSize: 20),
                          ))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text (
                        "Ya tienes cuenta ?",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => togSreen(),
                        child: Text(
                          "Iniciar Secion",
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
      ),
    );
  }
}
