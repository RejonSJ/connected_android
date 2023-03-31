import 'package:connected_android/pages/home_page.dart';
import 'package:connected_android/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/firebase_authentication.dart';
import '../services/validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(child: SvgPicture.asset(
            'images/logo/logoWithText.svg',
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
            width: 200,
            height: 200,
            )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Bienvenido', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        const Text('Inicia sesión con tu cuenta'),
                        const SizedBox(height: 8,),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                validator: (value) => Validator.validateEmail(
                                  email: value,
                                ),
                                focusNode: _focusEmail,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                decoration: InputDecoration(
                                  border:
                                    const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                  label: const Text('Correo electronico'),
                                  prefixIcon: SizedBox(
                                    width: 18,
                                    child: Icon(Icons.email_rounded, color:Theme.of(context).colorScheme.primary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              TextFormField(
                                validator: (value) => Validator.validatePassword(
                                  password: value,
                                ),
                                focusNode: _focusPassword,
                                controller: passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                decoration: InputDecoration(
                                  border:
                                    const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                  label: const Text('Contraseña'),
                                  prefixIcon: SizedBox(
                                    width: 18,
                                    child: Icon(Icons.lock_rounded, color: Theme.of(context).colorScheme.primary,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8,),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(onPressed: (){
                            
                        //   },
                        //   child: const Text('Olvidé mi contraseña')),
                        // ),
                        // const SizedBox(height: 8,),
                        FilledButton(
                          onPressed: () async {
                            _focusEmail.unfocus();
                            _focusPassword.unfocus();

                            if (_formKey.currentState!.validate()) {
                              User? user = await signInUsingEmailPassword(emailController.text, passwordController.text, context);
                              if (user != null) {
                                Navigator.of(context)
                                    .pushReplacement(
                                  MaterialPageRoute(builder: (context) => HomePage(user: user)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Error al iniciar sesión, compruebe sus datos"),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)
                          ),
                          child: const Text('Iniciar sesión')
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No tienes cuenta?'),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                    child: const Text('Registrate aquí'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}